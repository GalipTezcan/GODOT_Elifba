extends RigidBody2D


onready var Score=get_node("/root/Scores")
func _ready():
	pass
onready var destroy=false
func _input(event):
	if event is InputEventMouse and event.is_pressed() and destroy:
		get_parent().queue_free()
		Score.score+=1
	pass

func _on_RigidBody2D_mouse_entered():
	destroy=true
	pass


func _on_RigidBody2D_mouse_exited():
	destroy=true
	pass
