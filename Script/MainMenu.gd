extends CanvasLayer

onready var timer = $Timer
onready var soundEffectPlayer = $SFX
var buttonClickSFX

# Called when the node enters the scene tree for the first time.
func _ready():
	buttonClickSFX = preload("res://Import/SFX/ButtonClick.ogg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	soundEffectPlayer.stream = buttonClickSFX
	soundEffectPlayer.play()
	timer.start()
	
	return


func _on_OptionButton_pressed():
	soundEffectPlayer.stream = buttonClickSFX
	soundEffectPlayer.play()


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/MainScene.tscn")
