extends Area2D

var interact = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ComputerArea_body_entered(body):
	if(body.name == "Player"):
		$"../UserInterface/Instruction2".visible = true
		interact = true

func _input(event):
	if event.is_action_pressed("Interact"):
		if(interact):
			$"../UserInterface/Computer".visible = true

func _on_ComputerArea_body_exited(body):
	$"../UserInterface/Instruction2".visible = false
	interact = false
	$"../UserInterface/Computer".visible = false

