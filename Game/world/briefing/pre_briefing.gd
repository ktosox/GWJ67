extends Control

func _ready():
	load_day(GM.current_day)

func load_day(day = 1):
	assert([1,2,3,4,5].has(day))
	for page in $AllPages.get_children() :
		page.visible = false
	get_node("AllPages/Page" + String(day)).visible = true
	yield(get_tree().create_timer(1.0),"timeout")
	$TextPrinter.play_line("day"+String(day))
	yield(get_tree().create_timer(4.0),"timeout")
	$Button.visible = true
	pass


func _on_Button_pressed():
	GM.load_level()
	pass # Replace with function body.
