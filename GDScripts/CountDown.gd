extends Timer



export (NodePath) var CountDown
onready var count=get_node(CountDown)
var countint=60

func _on_Timer2_timeout():
	countint-=1
	if countint==0:
		
		Scores.lastGame="res://Scenes/LetterCathing.tscn"
		if Scores.score>Scores.Game1Best:
			Scores.Game1Best=Scores.score
		get_tree().change_scene("res://Scenes/EndScreen.tscn")
		
	count.text=str(countint)
	pass # Replace with function body.
func bomb_finish():
	Scores.lastGame="res://Scenes/LetterCathing.tscn"
	if Scores.score>Scores.Game1Best:
		Scores.Game1Best=Scores.score
	get_tree().change_scene("res://Scenes/EndScreen.tscn")
