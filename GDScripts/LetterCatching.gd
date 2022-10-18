extends TextureButton




func _on_LetterCatching_pressed():
	get_tree().change_scene("res://Scenes/LetterCathing.tscn")
	MusicController.stopMusic()
	pass # Replace with function body.


func _on_Fly_pressed():
	get_tree().change_scene("res://Scenes/FlyingFlippyBird.tscn")
	MusicController.stopMusic()
	pass # Replace with function body.


func _on_CardMatching_pressed():
	get_tree().change_scene("res://Scenes/KardMatching.tscn")
	MusicController.stopMusic()
	pass # Replace with function body.


func _on_Runner_pressed():
	get_tree().change_scene("res://Scenes/EndlessRunner.tscn")
	MusicController.stopMusic()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.
