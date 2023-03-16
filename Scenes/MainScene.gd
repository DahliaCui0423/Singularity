extends CanvasLayer

onready var task = $TaskPanel
onready var taskDetail = $Taskdetail


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Task1.tscn")
	return


func _on_BackButton_pressed():
	taskDetail.visible = false
	task.visible = true


func _on_DetailButton_pressed():
	taskDetail.visible = true
	task.visible = false
