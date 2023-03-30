extends KinematicBody2D


onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

const bulletPath = preload("res://Objects/Bullet.tscn")

var bvelocity = Vector2.ZERO
var bdegree = 45;

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
	if Input.is_action_just_pressed("ui_accept"):
		shoot()

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

func _input(event):
	if event.is_action_pressed("Pickup"):
		if $PickUpZone.items_in_range.size() > 0:
			var pickup_item = $PickUpZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickUpZone.items_in_range.erase(pickup_item)
			$"../../UserInterface/Instruction".visible = false

func shoot():
	for item in PlayerInventory.inventory:
		if(PlayerInventory.inventory[item][0] == "Gun"):
			var bullet = bulletPath.instance()
			get_parent().add_child(bullet)
			bullet.global_position = $bulletPosition.global_position
			bullet.velocity = bvelocity
			bullet.rotation_degrees = bdegree

func up():
	bvelocity = Vector2(0, -1)
	bdegree = -90
func down():
	bvelocity = Vector2(0, 1)
	bdegree = 90

func left():
	bvelocity = Vector2(-1, 0)
	bdegree = -180

func right():
	bvelocity = Vector2(1, 0)
	bdegree = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
