extends CanvasModulate


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var CurrentFrame = 0

# Called when the node enters the scene tree for the first time.
func _process(delta):
	#var time = OS.get_time()
	#var TimeInSeconds = time.hour * 3600 + time.minute * 60 + time.second
	#var CurrentFrame = range_lerp(TimeInSeconds,0,86400,0,24)
	#print(CurrentFrame)
	CurrentFrame += delta * 0.05
	if(CurrentFrame >= 24):
		CurrentFrame = 0
	$Day_Night_Cycle.play("Day_Night_Cycle")
	$Day_Night_Cycle.seek(CurrentFrame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	pass # Replace with function body.
