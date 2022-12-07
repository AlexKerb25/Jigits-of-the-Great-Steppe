extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speaker1 = "ASAN"
var speaker2 = "ALI"


onready var dialogues = {"ALI1":
	{"1":
		{"Text":tr("TRALID1_1"), 
		"Answers":[
			[tr("TRALID1_1A1"),["GOTO_2"]],
			[tr("TRALID1_1A2"),["END"]]
			]
		},
	"2":
		{"Text":tr("TRALID1_2"), 
		"Answers":[
			[tr("TRENDCONVERSATION"),["END"]]
			]
		}

		},
"BERKEATA1":
	{"1":
		{"Text":tr("TRBERKEATAD1_1"), 
		"Answers":[
			[tr("TRBERKEATAD1_1A1"),["GOTO_2"]],
			[tr("TRBERKEATAD1_1A2"),["END"]]
			]
		},
	"2":
		{"Text":tr("TRBERKEATAD1_2"), 
		"Answers":[
			[tr("TRENDCONVERSATION"),["END"]]
			]
		}

		},
		
"DANA1":
	{"1":
		{"Text":tr("TRDANAD1_1"), 
		"Answers":[
			[tr("TRDANAD1_1A1"),["GOTO_2"]],
			[tr("TRDANAD1_1A2"),["END"]]
			]
		},
	"2":
		{"Text":tr("TRDANAD1_2"), 
		"Answers":[
			[tr("TRENDCONVERSATION"),["END"]]
			]
		}

		}
		
		
		}
		
var dialogue = "ALI1"
var line

var button = preload("res://Answer.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Speaker1.text =tr("TR"+speaker1)
	$Speaker2.text =tr("TR"+speaker2)
	$Speaker1.visible_characters = 0
	$Speaker2.visible_characters = 0
	$Tween.interpolate_property($Speaker1, "visible_characters", 0, $Speaker1.text.length()+1,0.4)
	$Tween.interpolate_property($Speaker2, "visible_characters", 0, $Speaker2.text.length()+1,0.4)
	$Tween.start()
	start("1")
	pass # Replace with function body.

func start(firstphrase):
	$Label.text = dialogues[dialogue][firstphrase]["Text"]
	line = firstphrase
	$Label.visible_characters = 0
	$Tween2.interpolate_property($Label,"visible_characters", 0, $Label.text.length()+1,1)
	$Tween2.start()
	for x in dialogues[dialogue][line]["Answers"]:
		var i = button.instance()
		i.text = x[0]
		i.effects = x[1]
		$VBoxContainer.add_child(i)
	pass
func speak(phrase):
	for x in $VBoxContainer.get_children():
		x.queue_free()
	$Label.text = dialogues[dialogue][phrase]["Text"]
	line = phrase
	$Label.visible_characters = 0
	$Tween2.interpolate_property($Label,"visible_characters", 0, $Label.text.length()+1,1)
	$Tween2.start()
	for x in dialogues[dialogue][line]["Answers"]:
		var i = button.instance()
		i.text = x[0]
		i.effects = x[1]
		$VBoxContainer.add_child(i)
	pass
func effect(eff):
	match eff.split("_")[0]:
		"GOTO":
			speak(eff.split("_")[1])
		"END":
			queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
