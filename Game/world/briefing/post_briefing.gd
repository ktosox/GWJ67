extends Control

# amount of things X
# cargo lost X
# cargo damaged X
# total X
var list_of_things_to_display = {}




func _ready():
	$Button.visible = false
	assert(!list_of_things_to_display.empty())
	load_summary()
	

func load_summary():
	for next_thing in list_of_things_to_display:
		print("next thing is: ",next_thing)
		yield(get_tree().create_timer(1.5),"timeout")
	pass



func show_current_balance():
	$CurrentBalance.text = "Current balance: " + String(GM.current_balance)
	pass


func _on_Button_pressed():
	pass # Replace with function body.
