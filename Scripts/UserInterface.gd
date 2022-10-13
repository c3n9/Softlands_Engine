extends CanvasLayer

var holding_item = null

func _input(event):
	if event.is_action_pressed("inventory"):
		$Inventory.visible = !$Inventory.visible
		$Inventory.initialize_inventory()
	
	if event.is_action_pressed("scroll_up"):
		PlayerInventory.activate_scroll_down()
	elif event.is_action_pressed("scroll_down"):
		PlayerInventory.activate_scroll_up()
		
func _ready():
	pass
