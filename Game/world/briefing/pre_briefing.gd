extends Control

func _ready():
	load_day(GM.current_day)

func load_day(day = 1):
	assert([1,2,3,4,5].has(day))
	for page in $AllPages.get_children() :
		page.visible = false
	get_node("AllPages/Page" + String(day)).visible = true
	pass


func _on_Button_pressed():
	GM.load_level()
	pass # Replace with function body.
