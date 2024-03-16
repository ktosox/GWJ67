extends Control

var first_day = true

func start_game():
	if first_day:
		GM.load_pre_briefing(1)

	else:
		GM.load_pre_briefing(2)

	pass





func _on_Button_pressed():
	start_game()
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	first_day = button_pressed
	pass # Replace with function body.
