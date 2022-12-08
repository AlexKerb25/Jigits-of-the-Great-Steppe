extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemyattack = false
var ms = preload("res://PlayerCharacter.tscn")
var attackingcharacter
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in Data.party:
		var mi = ms.instance()
		mi.member = x
		$CanvasLayer/HBoxContainer.add_child(mi)
		pass
	

	
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		attackingcharacter = null
