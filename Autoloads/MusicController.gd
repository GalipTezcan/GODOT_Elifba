extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.playMusic()
	
	pass # Replace with function body.
func playMusic():
	get_child(0).play()
func stopMusic():
	get_child(0).stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
