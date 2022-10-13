extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.frame = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DoorArea_body_entered(body):
	animation.play("default")

func _on_DoorArea_body_exited(body):
	animation.play("default", true)
