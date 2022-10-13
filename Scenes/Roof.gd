extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tween = get_node("Tween")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_body_entered(body):
	if body.get_name() == "Hero":
		tween.interpolate_property(self, "modulate",
		Color(1,1,1,1), Color(1,1,1,0), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		#$Sprite.modulate = "82ffffff"


func _on_Area2D_body_exited(body):
	if body.get_name() == "Hero":
		tween.interpolate_property(self, "modulate",
		Color(1,1,1,0), Color(1,1,1,1), 0.2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
