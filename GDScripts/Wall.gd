extends Node2D


var _vel=Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+=_vel*delta
	
	pass


