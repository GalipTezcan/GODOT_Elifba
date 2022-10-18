extends Area2D


func _process(delta):
	position=get_global_mouse_position()
	if Input.is_action_pressed("click"):
		get_child(0).disabled=false
	else:
		get_child(0).disabled=true
	pass




func _on_Area2D_body_entered(body):
	var id=body.get_child(0).texture_normal.resource_path.split("(")[1].split(")")[0]
	if 28<int(id):
		get_tree().call_group("bombfinish","bomb_finish")
	else:
		body.visible=false
		Scores.score+=1
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer.stream=load("res://Sounds/Letter ("+id+").mp3")
		$AudioStreamPlayer.play()
		body.get_parent().queue_free()
	pass # Replace with function body.
