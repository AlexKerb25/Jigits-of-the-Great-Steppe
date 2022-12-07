extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mname = "ASAN"
var level = 1
var mclass = "WARRIOROFTHESTEPPE"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = tr("TR"+mname)
	$Label3.text = str(level) +" lvl"
	$Label2.text = tr("TR"+mclass)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = tr("TR"+mname)
	$Label3.text = str(level)+" lvl"
	$Label2.text = tr("TR"+mclass)
	pass


func _on_Member_mouse_entered():
	self_modulate = Color(1, 0, 0)
	pass # Replace with function body.


func _on_Member_mouse_exited():
	self_modulate = Color(1, 1, 1)
	pass # Replace with function body.


func _on_Member_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == 1:
			get_parent().get_parent().descmember(mname)
	pass # Replace with function body.
