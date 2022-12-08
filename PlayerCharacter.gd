extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var member

var portraits = {"ASAN":preload("res://Sprites/Concepts/ASAN_IDLE/Asan1.png"),
"ALI":preload("res://Sprites/Concepts/ALI_IDLE/Ali1.png"),
"BERKEATA":preload("res://Sprites/Concepts/BERKEATA_IDLE/BerkeAta1.png"),
"DANA":preload("res://Sprites/Concepts/DANA_IDLE/Dana1.png"),
"ZULAR":preload("res://Sprites/Concepts/ZULAR_IDLE/Zul'Ar1.png")}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Name.text = member["Name"] + " (" + str(member["Chars"]["Level"]) + ")"
	$TextureRect.texture = portraits[member["Name"]]
	$HPBAR.max_value = member["Chars"]["MaxHP"]
	$HPBAR.value = member["Chars"]["HP"]
	$MPBAR.max_value = member["Chars"]["Spirituality"]
	$MPBAR.value = member["Chars"]["Spirituality"]
	$HP.text = str(member["Chars"]["HP"])
	$MP.text = str(member["Chars"]["Spirituality"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_parent().get_parent().attackingcharacter != null:
		if get_parent().get_parent().get_parent().attackingcharacter != member:
			modulate = Color(0.2, 0.2, 0.2)
		else:
			modulate = Color(1, 1, 1)
	else:
		modulate = Color(1, 1, 1)
		


func _on_PlayerCharacter4_mouse_entered():
	if get_parent().get_parent().get_parent().attackingcharacter == null:
		self_modulate = Color(0.768627, 0.443137, 0.443137)
	pass # Replace with function body.


func _on_PlayerCharacter4_mouse_exited():
	self_modulate = Color(1, 1, 1)
	pass # Replace with function body.

func _on_PlayerCharacter4_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and get_parent().get_parent().get_parent().attackingcharacter == null:
			get_parent().get_parent().get_parent().attackingcharacter = member
			self_modulate = Color(1, 1, 1)
			
