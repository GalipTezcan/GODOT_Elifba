extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D3_body_entered(body):
	play()
	Scores.score+=1
	get_parent().get_child(0).visible=false
	
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	get_parent().get_parent().queue_free()
	pass # Replace with function body.
