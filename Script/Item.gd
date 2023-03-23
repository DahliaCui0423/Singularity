extends Node2D

var itemName
var itemQuantity

func _ready():
	itemName = "USB Drive"
	$TextureRect.texture = load("res://Import/ItemIcons/"+itemName+".png")
	var stackSize = int(JsonData.itemData[itemName]["StackSize"])
	itemQuantity = 1
	
	if stackSize == 1 || itemQuantity == 1:
		$TextureRect/Label.visible = false
	else:
		$TextureRect/Label.text = String(itemQuantity)

func add_item_quantity(amount):
	itemQuantity += amount
	if itemQuantity > 1:
		$TextureRect/Label.visible = true
		$TextureRect/Label.text = String(itemQuantity)

func decrease_item_quantity(amount):
	itemQuantity -= amount
	if itemQuantity == 1:
		$TextureRect/Label.visible = false
	else:
		$TextureRect/Label.text = String(itemQuantity)

func set_item(name, quantity):
	itemName = name
	itemQuantity = quantity
	$TextureRect.texture = load("res://Import/ItemIcons/"+itemName+".png")
	
	var stack_size = int(JsonData.itemData[itemName]["StackSize"])
	if stack_size == 1 || itemQuantity == 1:
		$TextureRect/Label.visible = false
	else:
		$TextureRect/Label.visible = true
		$TextureRect/Label.String(itemQuantity)
