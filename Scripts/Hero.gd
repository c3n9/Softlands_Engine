extends KinematicBody2D

const FRICTION = 500
const ACCELERATION = 500
const MAX_SPEED = 80

const teleport_bridge_y = 40
const teleport_bridge_x = 40

enum {
	IDLE,
	MOVE,
	CHOP,
	PLOW
}

var state = MOVE
var velocity = Vector2.ZERO
var work = IDLE

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	PlayerInventory.connect("active_item_updated", self, "update_work_mode")
	animationTree.active = true
	$HitBoxPivot/AttackHitBox/CollisionShape2D.set_deferred("disabled", true)

func update_work_mode():
	if PlayerInventory.hotbar.has(PlayerInventory.active_item_slot) and PlayerInventory.hotbar[PlayerInventory.active_item_slot][0] == "Axe":
		work = CHOP
	else:
		work = IDLE

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		PLOW:
			pass
		CHOP:
			chop_state(delta)
		IDLE:
			pass


func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - \
					 Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - \
					 Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Chop/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)

	if Input.is_action_just_pressed("attack"):
		if work == CHOP:
			state = CHOP
		else:
			state = MOVE

func chop_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Chop")

func chop_animation_finished():
	state = MOVE


func _input(event):
	if event.is_action_pressed("pickup"):
		if $InventoryRadius.items_in_range.size() > 0:
			var pickup_item = $InventoryRadius.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$InventoryRadius.items_in_range.erase(pickup_item)
	if event.is_action_pressed("exit"):
		get_tree().change_scene("res://Scenes/Menu.tscn")



func _on_Area2D_body_entered(body):
	global_position.y += teleport_bridge_y


func _on_Area2D2_body_entered(body):
	global_position.y -= teleport_bridge_y


func _on_Area2D3_body_entered(body):
	global_position.x += teleport_bridge_x


func _on_Area2D4_body_entered(body):
	global_position.x -= teleport_bridge_x
