extends CanvasLayer



onready var task = $TaskPanel
onready var taskDetail = $Taskdetail
onready var label = $Label
onready var tween = $Label/Tween


# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property(
		label, "percent_visible",
		0.0, 1.0, 3.0, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT
	)
	tween.start()


func _process(delta):
	if(label.percent_visible == 1):
		label.visible = false
		$Loading.visible = false
		task.visible = true
		$HomeButton.visible = true
		$TimeLabel.visible = true


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Task1.tscn")
	return


func _on_BackButton_pressed():
	taskDetail.visible = false
	task.visible = true


func _on_DetailButton_pressed():
	taskDetail.visible = true
	task.visible = false


func _on_HomeButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
