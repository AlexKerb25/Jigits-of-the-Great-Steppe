extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Interaction_area_entered(area):
	get_tree().get_nodes_in_group("BATTLEANIM")[0].playanim()
	pass # Replace with function body.
	
func give_data():
	return {"filename":filename,
	"position.x":position.x,
	"position.y":position.y,
}
