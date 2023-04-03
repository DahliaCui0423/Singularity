extends KinematicBody2D

onready var animPlay = $AnimationPlayer
onready var animTree = $AnimationTree
onready var area2D = $Area2D/CollisionShape2D
onready var animState = animTree.get("parameters/playback")

var player
var current_direction = "down"
var endPosition
const speed = 60
const accel = 1200
const frict = 1200
var veloc = Vector2.ZERO

var isFollow = false

export(String, FILE, "*.tres") var dialogue = null
export(String) var speaker1
export(String) var speaker2
var convo

enum{
	IDLE
	WALK
	NOTFOLLOW
}

var state = NOTFOLLOW

func _ready():
	player = get_node("../Player")
	endPosition = get_node("../../NPCrescueEnd2")
	if dialogue != null:
		convo= load(dialogue)

func _physics_process(delta):
	
	if veloc != Vector2.ZERO:
		animTree.set("parameters/Walk/blend_position", veloc)
		animTree.set("parameters/Idle/blend_position", veloc)
		
	Global.connect("endRescue", self, "rescueEnd")
		
	match state:
		IDLE:
			animState.travel("Idle")
			veloc = veloc.move_toward(Vector2.ZERO, frict * delta)
			if global_position.distance_to(player.position) > 10:
				state = WALK
			
		WALK:
			animState.travel("Walk")
			var direction = global_position.direction_to(player.position)
			veloc = veloc.move_toward(direction * speed, accel * delta)
	
			if global_position.distance_to(player.position) <= 10:
				state = IDLE
				
		NOTFOLLOW:
			animState.travel("Idle")
			veloc = Vector2.ZERO
			Global.connect("startRescueTobor",self,"rescueStart")
	veloc = move_and_slide(veloc)
	
	if veloc.length() > 0:
		current_direction = get_direction(veloc)
	animTree.set("parameters/Walk/current_direction", current_direction)
	

func get_direction(velocity):
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x < 0:
			return "left"
		else:
			return "right"
	else:
		if velocity.y < 0:
			return "up"
		else:
			return "down"


func _on_Area2D_body_entered(body):
	if body.name == "Player" && Global.speaking == false:
		Global.speaking = true
		DialogueManager.show_example_dialogue_balloon(speaker1, convo)


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		DialogueManager.exit()

func rescueStart():
	isFollow = true
	state = IDLE
	area2D.disabled = true
	

func _on_SafeZoneDetect_area_entered(area):
	if (area.name == "SafeZone") && Global.speaking == false:
		isFollow = false
		state = NOTFOLLOW
		Global.speaking = true
		DialogueManager.show_example_dialogue_balloon(speaker2, convo)


func _on_SafeZoneDetect_area_exited(area):
	if area.name == "SafeZone":
		DialogueManager.exit()
		
func rescueEnd():
	self.global_position = endPosition.global_position;
