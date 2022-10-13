extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().change_scene("res://Scenes/Main.tscn")

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_OptionsButton_pressed():
	pass


func _on_ExitButton_pressed():
	get_tree().quit()
