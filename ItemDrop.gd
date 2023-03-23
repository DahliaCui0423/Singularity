extends KinematicBody2D

export(String) var itemName
var player = null
var being_picked_up = false
var velocity = Vector2.ZERO

func _ready():
	$Sprite.texture = load("res://Import/ItemIcons/"+itemName+".png")

func _physics_process(delta):
	if being_picked_up:
		PlayerInventory.add_item(itemName, 1)
		queue_free()

func pick_up_item(body):
	player = body
	being_picked_up = true
