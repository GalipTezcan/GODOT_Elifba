extends Node2D


var _vel=Vector2(-2,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+=_vel*delta*100
	
	pass




func _on_Area2D2_body_entered(body):
	body.queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	body.queue_free()
	pass # Replace with function body.
