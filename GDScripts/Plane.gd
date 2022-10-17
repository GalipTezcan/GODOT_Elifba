extends KinematicBody2D



const gravity=300
const maxfallvel=400
const Fly=300
var _velocity=Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouse and event.is_pressed() and position.y>50:
		_velocity.y=-Fly
func _process(delta):
	if _velocity.y>0 and rotation_degrees>=40:
		rotation_degrees=40
	elif _velocity.y<0 :
		rotation_degrees=lerp(rotation_degrees,-10,-_velocity.y/100*delta)
	else:
		if _velocity.y>100:
			rotation_degrees=lerp(rotation_degrees,40,_velocity.y/250*delta)
		else:
			rotation_degrees=lerp(rotation_degrees,0,50/250*delta)
	_velocity.y+=gravity*delta
	if _velocity.y>maxfallvel:
		_velocity.y=maxfallvel
	_velocity=move_and_slide(_velocity)
	
	pass




func _on_AutoDestroyArea_area_entered(area):
	area.get_parent().queue_free()
	pass # Replace with function body.


func _on_AutoDestroyArea2_area_entered(area):
	if area.name=="ScoreAread":
		area.get_parent().queue_free()
	pass # Replace with function body.
