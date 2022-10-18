extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (NodePath) var Score
onready var score=get_node(Score)
var willspawn=preload("res://Scenes/Card.tscn")
var rng=RandomNumberGenerator.new()
var toggledNodes=[]
var allNodes=[]
var scoreint=0
var change=false
# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var rands=[]
	for h in range(9):
		var inti=rng.randi_range(1,28)
		while rands.has(inti):
			inti=rng.randi_range(1,28)
		for k in range(2):
			rands.append(inti)
	rands.shuffle()
	
	for i in range(18):
		var spawning=willspawn.instance()
		spawning.get_child(0).get_child(0).texture=load("res://Letters/Letter ("+str(rands[i])+").png")
		spawning.get_child(0).get_child(1).stream=load("res://Sounds/Letter ("+str(rands[i])+").mp3")
		allNodes.append(spawning)
		
		add_child(spawning)
	pass # Replace with function body.

func changeDisability():
	change=!change
	for node in allNodes:
		if !toggledNodes.has(node.get_child(0)):
			node.get_child(0).disabled=change

func _process(delta):
	if allNodes.size()==0 and toggledNodes[0].get_child(1).playing==false :
		Scores.score=scoreint
		if Scores.score>Scores.Game2Best:
			Scores.Game2Best=Scores.score
		Scores.lastGame="res://Scenes/KardMatching.tscn"
		get_tree().change_scene("res://Scenes/EndScreen.tscn")

func _toggled(node):
	if node in toggledNodes:
		pass
	else:
		toggledNodes.append(node)
	
	if toggledNodes.size()==2:
		var t = Timer.new()
		t.set_wait_time(1)
		t.set_one_shot(true)
		self.add_child(t)
		changeDisability()
		if toggledNodes[0].get_child(0).texture==toggledNodes[1].get_child(0).texture:
			toggledNodes[0].get_child(1).play()
			var gtime=$CountUp.countint
			if gtime<10:
				scoreint+=10
			elif gtime<30:
				scoreint+=3
			elif gtime<60:
				scoreint+=2
			else:
				scoreint+=1
			score.text=str(scoreint)
			for i in toggledNodes:
				allNodes.remove(allNodes.find(i.get_parent()))
				i.texture_normal=i.texture_pressed
				i.finded=true
		else:
			t.start()
			yield(t, "timeout")
			t.queue_free()
			for i in toggledNodes:
				i.pressed=false
		changeDisability()
		if allNodes.size()!=0:
			toggledNodes.clear()


func _on_Quit_pressed():
	Scores.score=scoreint
	if Scores.score>Scores.Game2Best:
			Scores.Game2Best=Scores.score
	Scores.lastGame="res://Scenes/KardMatching.tscn"
	get_tree().change_scene("res://Scenes/EndScreen.tscn")
	pass # Replace with function body.
