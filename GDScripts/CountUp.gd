extends Timer



export (NodePath) var CountUp
onready var count=get_node(CountUp)
export onready var countint=0

func _on_Timer2_timeout():
	countint+=1
	count.text=str(countint)
	pass # Replace with function body.

