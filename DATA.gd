extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var settings = {"fullscreen": false, "locale":"en"}
var party = [{"Name":"ASAN", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":100, 
"Spirituality":50},"Faith":"TENGRI", 
"Class":"WARRIOROFTHESTEPPE",
"Weapon":["HANDTOHAND","MELEE", 15,3,0.1],"BaseWeapon":["HANDTOHAND","MELEE",15,3,0.1],
"Skills":["BLOCK", "CRUSHINGPUNCH"]}]
# Called when the node enters the scene tree for the first time.
func _ready():
	Save.loadgame()
	OS.window_fullscreen = settings["fullscreen"]
	TranslationServer.set_locale(settings["locale"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
