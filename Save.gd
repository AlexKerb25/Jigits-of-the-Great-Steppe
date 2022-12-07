extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func savegame():
	var f = File.new()
	f.open("user://save.jots",File.WRITE)
	f.store_line(to_json(Data.settings))
	f.close()
	pass

func loadgame():
	var f = File.new()
	if f.open("user://save.jots",File.READ) != OK:
		return
	Data.settings = parse_json(f.get_line())
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
