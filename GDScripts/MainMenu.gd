extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),value)
	Scores.SoundVolume=value
	pass # Replace with function body.


func _on_Button_pressed():
	Scores.Save()
	get_tree().change_scene("res://Scenes/MainScene.tscn")
	
	pass # Replace with function body.


func _on_HSlider_ready():
	$Label/HSlider.value=Scores.SoundVolume
	print($Label/HSlider.value)
	print(Scores.SoundVolume)
	pass # Replace with function body.


func _on_TextureButton_pressed():
	OS.shell_open("https://github.com/GalipTezcan")
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	OS.shell_open("https://www.linkedin.com/in/galip-t-9520aa164")
	pass # Replace with function body.
