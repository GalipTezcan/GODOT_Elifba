extends Timer


var willspawn=preload("res://Scenes/EndlessRunnerSpawn.tscn")

var rng = RandomNumberGenerator.new()
var inti=0
export var vel=-300
onready var posArray=[]
onready var scorelabel=get_child(0)
onready var Score=get_node("/root/Scores")
onready var willspawnwall=preload("res://Scenes/Letter2.tscn")
export (NodePath) var positons
onready var poss= get_node(positons)
var spawningsvel=Vector2(vel,0)

func _ready():
	for node in poss.get_children():
		posArray.append(node)
	rng.randomize()
	for i in range(rng.randi_range(1,2)):
		var spawning=willspawn.instance()
		spawning.get_child(0).linear_velocity.x=vel
		vel-=20
		inti+=1
		inti=inti%28
		spawning.position.x=1300+(i-1)*60
		spawning.position.y=490
		self.get_parent().call_deferred("add_child",spawning)
	wait_time-=0.02
func _process(_delta):
	if scorelabel.text!=str(Score.score):
		scorelabel.text=str(Score.score)
	
	pass



func _on_Timer_timeout():
	rng.randomize()
	wait_time=rng.randi_range(2,3)
	
	for i in range(rng.randi_range(1,int(-vel/150))):
		var spawning=willspawn.instance()
		spawning.get_child(0).linear_velocity.x=vel
		if vel >-700:
			vel-=5
	
		inti+=1
		inti=inti%28
		spawning.position.x=1300+(i-1)*60
		spawning.position.y=475
		self.get_parent().add_child(spawning)
	
	
	if wait_time>0.4:
		wait_time-=0.02
	
	pass


func _on_Timer2_timeout():
	$Timer2.wait_time=rng.randi_range(7,10)
	var spawning=willspawnwall.instance()
	spawning._vel.x=vel
	
	spawning.get_child(0).get_child(0).texture=load("res://Letters/Letter ("+str(inti+1)+").png")
	spawning.get_child(0).get_child(2).stream=load("res://Sounds/Letter ("+str(inti+1)+").mp3")
	inti+=1
	inti=inti%28
	rng.randomize()
	spawning.position.y=rng.randi_range(posArray[0].position.y,posArray[posArray.size()-1].position.y)
	posArray[0].get_parent().add_child(spawning)
	
	
	pass
	pass # Replace with function body.
