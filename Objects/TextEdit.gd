extends TextEdit

onready var password = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	add_color_region('"','"', Color(0.892114, 0.933594, 0.402649))
	add_color_region('#','', Color(0.40625, 0.40625, 0.40625), true)
	add_color_region('$', '.', Color(0.399676, 0.867188, 0.538469))
	add_keyword_color("text", Color(0.657505, 0.975918, 1))
	
	var redKeywords = ["func", "extends", "var", "const", "in", "null", "onready"]
	for red in redKeywords:
		add_keyword_color(red, Color(0.753906, 0.200829, 0.200829))
	
	var purpleKeywords = ["if", "else", "for", "return"]
	for purple in purpleKeywords:
		add_keyword_color(purple, Color(0.830417, 0.611018, 0.941406))

func code_finished():
	var line_text = get_line(15)
	var line_parts = line_text.split("=") 
	var name_value = line_parts[1].lstrip(" ")
	if(name_value != '""'):
		password = name_value.lstrip('"').rstrip('"')
		print(password)


func _on_CodingCloseButton_pressed():
	code_finished()
	self.visible = false
