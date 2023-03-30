extends Node2D




func _on_ComputerDoorArea_body_entered(body):
	if(body.name == "Player"):
		$"../YSort/Player".global_position = $"../MainRoom".global_position




func _on_MainDoorArea_body_entered(body):
	if(body.name == "Player"):
		$"../YSort/Player".global_position = $"../ComputerRoom".global_position


func _on_LabDoorArea_body_entered(body):
	if(body.name == "Player"):
		$"../YSort/Player".global_position = $"../MainRoom2".global_position


func _on_MainDoorArea2_body_entered(body):
	if(body.name == "Player"):
		$"../YSort/Player".global_position = $"../LabRoom".global_position
