extends KinematicBody2D

var velocity = Vector2(1, 0)
var speed = 300

func _ready():
	$Timer.start()

func _physics_process(delta):
	var collistion_info = move_and_collide(velocity.normalized() * delta * speed)



func _on_Timer_timeout():
	self.queue_free()
