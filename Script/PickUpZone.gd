extends Area2D

onready var instruction = get_node("../../../UserInterface/Instruction")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var items_in_range = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PickUpZone_body_entered(body):
	items_in_range[body] = body
	instruction.visible = true

func _on_PickUpZone_body_exited(body):
	if items_in_range.has(body):
		items_in_range.erase(body)
	instruction.visible = false
