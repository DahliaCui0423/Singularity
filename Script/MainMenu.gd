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


func _on_CreditButton_pressed():
	soundEffectPlayer.stream = buttonClickSFX
	soundEffectPlayer.play()
	$TextureRect.visible = false
	$StartButton.visible = false
	$CreditButton.visible = false
	$Credit.visible = true

func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/MainScene.tscn")


func _on_CloseButton_pressed():
	soundEffectPlayer.stream = buttonClickSFX
	soundEffectPlayer.play()
	$Credit.visible  = false
	$TextureRect.visible = true
	$StartButton.visible = true
	$CreditButton.visible = true
