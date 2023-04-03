extends TextureRect

onready var passwordInput = ""



func _on_Okbutton_pressed():
	passwordInput = $PasswordInput.text
	var password = $"../TextEdit".password
	if(passwordInput != ""):
		if(passwordInput == password):
			$"../Disk".visible = true
			$PasswordInput.text = ""
			self.visible = false
		else:
			$WarningMsg.visible = true
	else:
		$WarningMsg.visible = true


func _on_PwdCloseButton_pressed():
	$PasswordInput.text = ""
	$WarningMsg.visible = false
	self.visible = false
