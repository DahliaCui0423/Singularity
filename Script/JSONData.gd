extends Node

var itemData: Dictionary

func _ready():
	itemData = LoadData("res://ItemData.json")
	
func LoadData(file_path):
	var jsonData
	var fileData = File.new()
	
	fileData.open(file_path, File.READ)
	jsonData = JSON.parse(fileData.get_as_text())
	fileData.close()
	return jsonData.result
