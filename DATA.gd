extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var settings = {"fullscreen": false, "locale":"en"}
var party = [{"Name":"ASAN", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":100,"MaxHP":100,
"Spirituality":50},"Faith":"TENGRI", 
"Class":"WARRIOROFTHESTEPPE",
"Weapon":["HANDTOHAND","MELEE", 5,15,3,0.1],"BaseWeapon":["HANDTOHAND","MELEE",15,3,0.1],
"Skills":["BLOCK", "CRUSHINGPUNCH"]}]

var potential_members = {"ALI":{"Name":"ALI", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":110,"MaxHP":110,
"Spirituality":25},"Faith":"TENGRI", 
"Class":"AXEMASTER",
"Weapon":["BATTLEAXE","MELEE", 4,12,7,0.3],"BaseWeapon":["BATTLEAXE","MELEE", 4,12,7,0.3],
"Skills":["RUTHLESSASSAULT", "MIGHTYBLOW"]},

"BERKEATA":{"Name":"BERKEATA", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":85,"MaxHP":85, 
"Spirituality":65},"Faith":"TENGRI", 
"Class":"SPEARMAN",
"Weapon":["SPEAR","MELEE", 6,17,6,0.15],"BaseWeapon":["SPEAR","MELEE", 6,17,6,0.15],
"Skills":["ACCURATEBLOW", "INSPIRATION"]},

"DANA":{"Name":"DANA", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":70,"MaxHP":70, 
"Spirituality":40},"Faith":"TENGRI", 
"Class":"ARCHER",
"Weapon":["BOW","RANGED", 4,12,5,0.05],"BaseWeapon":["BOW","RANGED", 4,12,5,0.05],
"Skills":["POISONEDARROW", "SUPPRESSION"]},

"ZULAR":{"Name":"ZULAR", 
"Chars":{"Level":1,"EXP":0,
"EXPtoLevel":50,"HP":75,"MaxHP":75, 
"Spirituality":80},"Faith":"ZOROASTRI", 
"Class":"HEALER",
"Weapon":["FIREBURST","RANGED", 10,20,7,0],"BaseWeapon":["FIREBURST","RANGED", 10,20,7,0],
"Skills":["HEALINGFLAMES", "FIRERAIN"]}
}
# Called when the node enters the scene tree for the first time.
func _ready():
	Save.loadgame()
	OS.window_fullscreen = settings["fullscreen"]
	TranslationServer.set_locale(settings["locale"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
