extends Control

# amount of things X
# cargo lost X
# cargo damaged X
# total X


var post_line_scene = preload("res://world/briefing/post_line.tscn")



func _ready():
	$Button.visible = false
	assert(!GM.list_of_things_to_display.empty())

	load_summary()
	

func add_line(text_array = []):
	var new_line = post_line_scene.instance()
	new_line.get_node("TextLeft").text = " " + text_array[0]
	new_line.get_node("TextRight").text = " " + text_array[1]
	if int(text_array[1]) < 0:
		new_line.get_node("ColorRect").color = ColorN("red")
	$PerformanceSummary.add_child(new_line)

	pass

func load_summary():
	for next_thing in GM.list_of_things_to_display:
		#print("next thing is: ",next_thing)
		add_line([" "+next_thing,GM.list_of_things_to_display[next_thing]])
		$PerformanceSummary.add_child($PerformanceSummary/Seperator.duplicate())
		yield(get_tree().create_timer(0.8),"timeout")
	
	yield(get_tree().create_timer(0.8),"timeout")
	add_line([" Current balance",String(GM.current_balance)])
	$Button.visible = true
	pass



func show_current_balance():
	$CurrentBalance.text = "Current balance: " + String(GM.current_balance)
	pass


func _on_Button_pressed():
	GM.load_pre_briefing()
	pass # Replace with function body.
