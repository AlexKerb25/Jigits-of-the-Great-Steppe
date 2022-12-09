extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var faded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if Data.events.has("INVASION"):
		queue_free()
	pass # Replace with function body.

func fade():
	add_to_group("BLOCKER")
	$Tween.interpolate_property(self, "modulate:a", 0, 1, 2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tween_tween_completed(object, key):
	yield(get_tree().create_timer(1),"timeout")
	if faded == false:
		for x in get_tree().get_nodes_in_group("NPC"):
			x.queue_free()
			
		$Tween.interpolate_property(self, "modulate:a", 1, 0, 2)
		faded = true
		Data.events.append("INVASION")
	else:
		queue_free()
	Save.savegame()
	pass # Replace with function body.
