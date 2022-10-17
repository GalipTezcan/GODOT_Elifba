extends Timer


var willspawn=preload("res://Scenes/Spawn.tscn")
var rng = RandomNumberGenerator.new()
export (NodePath) var positons
var inti=0
onready var posArray=[]
onready var scorelabel=get_child(0)
onready var poss= get_node(positons)
onready var Score=get_node("/root/Scores")
func _ready():
	
	for node in poss.get_children():
		print(node)
		posArray.append(node)
func _process(_delta):
	if scorelabel.text!=str(Score.score):
		scorelabel.text=str(Score.score)
	
	pass


onready var lastpositon=0
func _on_SpwanTimer_timeout():
	var spawning=willspawn.instance()
	if spawning.get_child(0).linear_velocity.y <400:
		spawning.get_child(0).linear_velocity.y+=20
	rng.randomize()
	spawning.get_child(0).get_child(0).texture_normal=load("res://LettersforCatching/Letter ("+str(rng.randi_range(1,35))+").png")
	
	var newpos=rng.randi_range(posArray[0].position.x,posArray[posArray.size()-1].position.x)
	while abs(newpos-lastpositon)<50:
		newpos=rng.randi_range(posArray[0].position.x,posArray[posArray.size()-1].position.x)
	spawning.position.x=newpos
	lastpositon=spawning.position.x
	posArray[0].get_parent().add_child(spawning)
	
	
	if wait_time>0.8:
		wait_time-=0.002
	
	pass
