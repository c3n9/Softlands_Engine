extends Node2D

func create_grass_destroy_effect():
	var GrassEffect = load("res://Scenes/TreeDestroyEffect.tscn")
	var grassEffect = GrassEffect.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position

func _on_HurtBox_area_entered(area):
	create_grass_destroy_effect()
	queue_free()
