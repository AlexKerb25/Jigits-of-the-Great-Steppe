extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var id = 1
export var layout = '1'


# Called when the node enters the scene tree for the first time.
func _ready():
	if Data.enemy_id != null:
		if Data.enemy_id == id:
			queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Interaction_area_entered(area):
	if $Timer.is_stopped() == false:
		return
	Save.savegame()
	Data.enemy_id = id
	Data.layout = layout
	get_tree().get_nodes_in_group("BATTLEANIM")[0].playanim()
	pass # Replace with function body.
	
func give_data():
	return {"filename":filename,
	"position.x":position.x,
	"position.y":position.y,
	"id":id,
	"layout":"1",
}
