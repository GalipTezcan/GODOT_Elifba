extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Score=get_node("/root/Scores")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouse and event.is_pressed():
		if get_rect().has_point(to_local(event.position)):
			get_parent().queue_free()
			Score.score+=1
			
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
