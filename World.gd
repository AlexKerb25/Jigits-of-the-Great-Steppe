extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data
var event1 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if Save.data != null:
		data = Save.data
		print(data)
		loading()
	else:
		Save.savegame()
	for x in Data.party:
		levelup(x)
	yield(get_tree().create_timer(0.1),"timeout")
	Save.savegame()
	pass # Replace with function body.

func levelup(obj):
	if obj["Chars"]["EXP"] >= obj["Chars"]["EXPtoLevel"]:
		obj["Chars"]["EXP"] -= obj["Chars"]["EXPtoLevel"]
		obj["Chars"]["Level"] += 1
		obj["Chars"]["MaxHP"] *= 1.1
		obj["Chars"]["HP"] = obj["Chars"]["MaxHP"]
		obj["Chars"]["Spirituality"] *= 1.1
		obj["Chars"]["EXPtoLevel"] *= 1.3
		levelup(obj)

func saving():
	var result = []
	for x in get_tree().get_nodes_in_group("Saveobject"):
		result.append(x.give_data())
	return result

func loading():
	for x in $TileMap.get_children():
		x.queue_free()
	for x in data:
		var i = load(x["filename"]).instance()
		i.position = Vector2(x["position.x"],x["position.y"])
		for y in x.keys():
			if not y in ["filename","position.x","position.y"]:
				i.set(y, x[y])
		$TileMap.add_child(i)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://BATTLE.tscn")
	pass # Replace with function body.
