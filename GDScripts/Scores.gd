extends Node

const PATH="user://save.json"
onready var score=0
onready var Game1Best=0
onready var Game2Best=0
onready var Game3Best=0
onready var Game4Best=0

onready var lastGame=""
onready var SoundVolume=0

var file=File.new()

func Save():
	var Error=file.open(PATH,File.WRITE)
	if Error!=OK:
		print("Couldnt Save!!!!!!!!")
		return
	var data={
		"SoundVolume":SoundVolume,
		"Game1Best":Game1Best,
		"Game2Best":Game2Best,
		"Game3Best":Game3Best,
		"Game4Best":Game4Best
	}
	var json=JSON.print(data)
	file.store_string(json)
	file.close()
	pass

func Read():
	var Error=file.open(PATH,File.READ)
	if Error!=OK:
		print("Couldnt Open!!!!!!!!")
		return
	var data:Dictionary =JSON.parse(file.get_as_text()).result
	file.close()
	SoundVolume=data.SoundVolume
	Game1Best=data.Game1Best
	Game2Best=data.Game2Best
	Game3Best=data.Game3Best
	Game4Best=data.Game4Best
	
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),SoundVolume)
func _ready():
	Read()
	
