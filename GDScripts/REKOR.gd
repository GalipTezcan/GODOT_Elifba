extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Scores.lastGame=="res://Scenes/LetterCathing.tscn":
		text=str(Scores.Game1Best)
	if Scores.lastGame=="res://Scenes/KardMatching.tscn":
		text=str(Scores.Game2Best)
	if Scores.lastGame=="res://Scenes/FlyingFlippyBird.tscn":
		text=str(Scores.Game3Best)
	if Scores.lastGame=="res://Scenes/EndlessRunner.tscn":
		text=str(Scores.Game4Best)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
