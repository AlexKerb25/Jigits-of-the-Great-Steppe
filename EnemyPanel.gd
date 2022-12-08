extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hp = 100
var maxhp = 100
var attackpower = 30
var cd = 15
var counterpercent = 0.1
export var type = 'dzungar1'

var dzungaranimation = {'dzungar1': preload('res://Sprites/ANIMS/Dzungar1.tres'), 'dzungar2': preload('res://Sprites/ANIMS/Dzungar2.tres'), 'dzungar3': preload('res://Sprites/ANIMS/Dzungar3.tres'), 'dzungar4': preload('res://Sprites/ANIMS/Dzungar4.tres')}



# Called when the node enters the scene tree for the first time.
func _ready():
	$HP2.text = str(hp)
	$HP.max_value = maxhp
	$HP.value = hp
	$TextureRect.texture = dzungaranimation[type]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HP2.text = str(hp)
	$HP.max_value = maxhp
	$HP.value = hp
	if hp <= 0:
		queue_free()
	



func _on_EnemyPanel_mouse_entered():
	if get_parent().get_parent().get_parent().attackingcharacter != null:
		modulate = Color(0.768627, 0.443137, 0.443137)
	pass # Replace with function body.


func _on_EnemyPanel_mouse_exited():
	modulate = Color(1, 1, 1)
	pass # Replace with function body.

func get_member_panel(member):
	for x in get_tree().get_nodes_in_group("PlayerPanel"):
		if x.member == member:
			return x
func _on_EnemyPanel_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1 and get_parent().get_parent().get_parent().attackingcharacter != null:
			var attacker = get_member_panel(get_parent().get_parent().get_parent().attackingcharacter)
			hp -= (get_parent().get_parent().get_parent().attackingcharacter["Weapon"][3])+(get_parent().get_parent().get_parent().attackingcharacter["Weapon"][4]*get_parent().get_parent().get_parent().attackingcharacter["Chars"]["Level"])
			if attacker.member["Weapon"][1] == "MELEE":
				attacker.member["Chars"]["HP"] -= attackpower*counterpercent
			attacker.gonacd(get_parent().get_parent().get_parent().attackingcharacter["Weapon"][2])
			
			get_parent().get_parent().get_parent().attackingcharacter = null
	pass # Replace with function body.
