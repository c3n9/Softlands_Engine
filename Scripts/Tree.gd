extends Node2D

onready var tween = get_node("Tween")

func create_grass_destroy_effect():
	var GrassEffect = load("res://Scenes/TreeDestroyEffect.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position

func item_dropping():
	var GrassEffect = load("res://Scenes/TreeItem.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position


func _on_HurtBox_area_entered(area):
	create_grass_destroy_effect()
	item_dropping()
	queue_free()


func _on_Area2D_body_entered(body):
	if body.get_name() == "Hero":
		tween.interpolate_property($Sprite, "modulate",
		Color(1,1,1,1), Color(1,1,1,0.5), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		#$Sprite.modulate = "82ffffff"


func _on_Area2D_body_exited(body):
	if body.get_name() == "Hero":
		tween.interpolate_property($Sprite, "modulate",
		Color(1,1,1,0.5), Color(1,1,1,1), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		$Sprite.modulate = "ffffff"
