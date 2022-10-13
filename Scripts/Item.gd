extends Node2D

var item_name
var item_quantity

enum {
	CLOCK,
	BED,
	MUSHROOM
}

func _ready():
	pass

func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)

func decrease_item_quantity(amount_to_add):
	item_quantity -= amount_to_add
	$Label.text = String(item_quantity)

func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://inventory/item_icons/" + nm + ".tres")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	# 1 - one whole item
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = String(qt)
