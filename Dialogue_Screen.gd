extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speaker1 = "ASAN"
var speaker2 = "BERKEATA"


var dialogues = {"ALI1":
	{"1":
		{"Text":tr("ALID1_1"), 
		"Answers":[
			[tr("TRALID1_A1"),["GOTO_2"]],
			[tr("TRALID1_A2"),["END"]]
			]
		},
	"2":
		{"Text":tr("ALID1_2"), 
		"Answers":[
			[tr("TRENDCONVERSATION"),["END"]]
			]
		}

		}}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Speaker1.text =tr("TR"+speaker1)
	$Speaker2.text =tr("TR"+speaker2)
	$Speaker1.visible_characters = 0
	$Speaker2.visible_characters = 0
	$Tween.interpolate_property($Speaker1, "visible_characters", 0, $Speaker1.text.length()+1,0.4)
	$Tween.interpolate_property($Speaker2, "visible_characters", 0, $Speaker2.text.length()+1,0.4)
	$Tween.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
