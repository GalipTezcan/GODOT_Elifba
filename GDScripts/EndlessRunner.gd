extends RigidBody2D


	
func _input(event):
	if event is InputEventMouse and event.is_pressed() and linear_velocity.y<2 and position.y>480:
		linear_velocity.y=-650
		$Icon.texture=load("res://1x/Asset 93.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if linear_velocity.y>0 and position.y<480:
		linear_velocity.y+=1000*delta
	if abs(linear_velocity.y)<4:
		$Icon.texture=load("res://1x/Asset 91.png")



func _on_RigidBody2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	
	if body.get_class()=="RigidBody2D":
		Scores.lastGame="res://Scenes/EndlessRunner.tscn"
		if Scores.score>Scores.Game4Best:
			Scores.Game4Best=Scores.score
		get_tree().change_scene("res://Scenes/EndScreen.tscn")
	pass # Replace with function body.


func _on_AutoDestroyArea_body_entered(body):
	if body.get_class()=="RigidBody2D":
		body.get_parent().free()
		Scores.score+=1
	
	pass # Replace with function body.



