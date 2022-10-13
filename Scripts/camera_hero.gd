extends Camera2D

var zoom_min = Vector2(.40001, .40001)
var zoom_max = Vector2(1.6, 1.6)
var zoom_speed = Vector2(.2, .2)
var des_zoom = zoom

func _process(delta):
	zoom = lerp(zoom, des_zoom, .2)

func _input(event):
## WITH MOUSE!!!
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if event.button_index == BUTTON_WHEEL_UP:
#				if des_zoom > zoom_min:
#					des_zoom -= zoom_speed
#			if event.button_index == BUTTON_WHEEL_DOWN:
#				if des_zoom < zoom_max:
#					des_zoom += zoom_speed
	if event.is_action_pressed("zoom_in"):
		if des_zoom > zoom_min:
			des_zoom -= zoom_speed
	if event.is_action_pressed("zoom_out"):
		if des_zoom < zoom_max:
			des_zoom += zoom_speed
