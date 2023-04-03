extends Node2D




# Called when the node enters the scene tree for the first time.
func _process(delta):
	Global.connect("rshow", self, "showRechael")

func showRechael():
	$YSort/Rechael.visible = true
	$YSort/Rechael.get_node("Area2D/CollisionShape2D").disabled = false
	$YSort/Rechael.get_node("SafeZoneDetect/CollisionShape2D").disabled = false
