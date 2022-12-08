extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hp = 100
var maxhp = 100
var attackpower = 30
var cd = 15
export var type = 'dzungar1'

var dzungaranimation = {'dzungar1': preload('res://Sprites/ANIMS/Dzungar1.tres'), 'dzungar2': preload('res://Sprites/ANIMS/Dzungar2.tres'), 'dzungar3': preload('res://Sprites/ANIMS/Dzungar3.tres'), 'dzungar4': preload('res://Sprites/ANIMS/Dzungar4.tres')}



# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect.texture = dzungaranimation[type]
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HP2.text = str(hp)
	$HP.max_value = maxhp
	$HP.value = hp
	

