extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal Toggled
var finded=false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	

func _on_TextureButton_toggled(button_pressed):
	if not finded:
		get_child(0).visible=int(button_pressed)
	
	emit_signal("Toggled")
	pass # Replace with function body.
	


func _on_TextureButton_tree_entered():
	connect ("Toggled",get_parent().get_parent(), "_toggled",[self])
	pass # Replace with function body.
