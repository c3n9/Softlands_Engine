extends KinematicBody2D

onready var item_name = "Log"

const ACCELARATION = 460
const MAX_SPEED = 225

var velocity = Vector2.ZERO

var player = null
var picked_up = false

func _physics_process(delta):
	if picked_up:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELARATION * delta)
		
		var distance = global_position.distance_to(player.global_position)
		if distance < 10:
			PlayerInventory.add_item(item_name, 1)
			queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)

func pick_up_item(body):
	player = body
	picked_up = true


func _on_TreeItem_mouse_entered():
	pass
