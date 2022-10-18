extends Timer


var willspawn=preload("res://Scenes/Wall.tscn")
var rng = RandomNumberGenerator.new()
export (NodePath) var positons
var intp=0
var inti=0
onready var posArray=[]
onready var scorelabel=get_child(0)
onready var poss= get_node(positons)
onready var Score=get_node("/root/Scores")
var spawningsvel=Vector2(-2,0)
func _ready():
	
	for node in poss.get_children():
		posArray.append(node)

	var spawning=willspawn.instance()
	rng.randomize()
	spawning.position.y=rng.randi_range(posArray[0].position.y,posArray[posArray.size()-1].position.y)
	posArray[0].get_parent().add_child(spawning)
	inti+=1
func _process(_delta):
	if scorelabel.text!=str(Score.score):
		scorelabel.text=str(Score.score)
	
	pass



func _on_SpwanTimer_timeout():
	intp+=3
	
	var spawning=willspawn.instance()
	spawning._vel=spawningsvel
	spawningsvel.x-=0.05
	spawning.get_child(0).position.y-=intp
	spawning.get_child(1).position.y+=intp
	
	spawning.get_child(3).get_child(0).texture=load("res://Letters/Letter ("+str(inti+1)+").png")
	spawning.get_child(2).stream=load("res://Sounds/Letter ("+str(inti+1)+").mp3")
	inti+=1
	inti=inti%28
	rng.randomize()
	spawning.position.y=rng.randi_range(posArray[0].position.y,posArray[posArray.size()-1].position.y)
	posArray[0].get_parent().add_child(spawning)
	
	
	pass


func _on_KinematicBody2D_tree_exited():
	Scores.lastGame="res://Scenes/FlyingFlippyBird.tscn"
	if Scores.score>Scores.Game3Best:
			Scores.Game3Best=Scores.score
	get_tree().change_scene("res://Scenes/EndScreen.tscn")
	pass # Replace with function body.


func _on_ScoreAread_area_entered(area):
	if area.name=="Area2D3":
		Score.score+=1
	pass # Replace with function body.
