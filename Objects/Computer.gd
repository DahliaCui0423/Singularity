extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	for item in PlayerInventory.inventory:
		if(PlayerInventory.inventory[item][0] == "USB Drive"):
			$windows/DiskButton.visible = true
			$windows/Label.visible = true
			$GodotButton.visible = true


func _on_Computer_pressed():
	$windows.visible = true


func _on_CloseButton_pressed():
	$windows.visible = false


func _on_DiskButton_pressed():
	$PasswordInput.visible = true


func _on_GodotButton_pressed():
	$TextEdit.visible = true


func _on_DiskCloseButton_pressed():
	$Disk.visible = false


func _on_FileButton2_pressed():
	$WordFile.visible = true


func _on_WordFileCloseButton_pressed():
	$WordFile.visible = false


func _on_TrashCan_pressed():
	$TrashPanel.visible = true


func _on_TrashCloseButton_pressed():
	$TrashPanel.visible = false


func _on_TextureButton_pressed():
	self.visible = false
