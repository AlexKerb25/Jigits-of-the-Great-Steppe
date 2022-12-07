extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var character = "ALI"
export var dialogue = "ALI1"
export var need_dialogue = false

var p = false
var ds = preload("res://Dialogue_Screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play(character+"_IDLE")
	if need_dialogue:
		$AnimatedSprite2.visible = true
	else:
		$AnimatedSprite2.visible = false
	if Input.is_action_just_pressed("ui_accept"):
		if need_dialogue and p:
			need_dialogue = false
			var d = ds.instance()
			d.speaker1 = "ASAN"
			d.speaker2 = character
			d.dialogue = dialogue
			get_parent().get_parent().get_node("GUI").add_child(d)
		pass
	pass


func _on_Interaction_area_entered(area):
	if area.type == "PLAYER":
		p = true
	pass # Replace with function body.


func _on_Interaction_area_exited(area):
	if area.type == "PLAYER":
		p = false
	pass # Replace with function body.