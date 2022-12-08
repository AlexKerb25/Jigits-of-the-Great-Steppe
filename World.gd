extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data

# Called when the node enters the scene tree for the first time.
func _ready():
	if Save.data != null:
		data = Save.data
		print(data)
		loading()
	pass # Replace with function body.

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
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://BATTLE.tscn")
	pass # Replace with function body.
