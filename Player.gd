extends KinematicBody2D


onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

enum {
	MOVE,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
export var max_speed = 150


# Called when the node enters the scene tree for the first time.
func _ready():
	animationTree.active = true
	
func _physics_process(delta):
	match state:
		MOVE:
			state_move(delta)
		ATTACK:
			pass
			#state_attack(delta)

func state_move(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		#animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Walk")
		velocity = input_vector * max_speed
	else:
		animationState.travel("Idle")
		velocity = Vector2.ZERO
	
	move()

func move():
	velocity = move_and_slide(velocity)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
