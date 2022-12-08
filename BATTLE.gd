extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemyattack = false
var ms = preload("res://PlayerCharacter.tscn")
var attackingcharacter
var switch2 = false

var victory = false

var es = preload("res://EnemyPanel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in Data.party:
		var mi = ms.instance()
		mi.member = x
		$CanvasLayer/HBoxContainer.add_child(mi)
		pass
	$AudioStreamPlayer.play()
	for x in Data.enemy_layouts[Data.layout]:
		var ei = es.instance()
		for y in x.keys():
			ei.set(y,x[y])
		$CanvasLayer/HBoxContainer2.add_child(ei)
	Data.layout = null
	
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		attackingcharacter = null
	var switch = false

	for x in Data.party:
		if x["Name"] == "ASAN":
			switch = true
	if switch == false and switch2 == false:
		$CanvasLayer/Outro.play()
		switch2 = true
	if $CanvasLayer/HBoxContainer2.get_children().size() == 0 and switch2 == false:
		$CanvasLayer/Outro.play()
		victory = true
		switch2 = true
		pass
