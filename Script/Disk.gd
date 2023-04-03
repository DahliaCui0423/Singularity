extends TextureRect




func _on_FileButton_pressed():
	$FileButton.visible = false
	$FileLabel.visible  = false
	$FileButton2.visible = true
	$FileLabel2.visible = true
	Global.emit_signal("rshow")

