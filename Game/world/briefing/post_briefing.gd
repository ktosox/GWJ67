extends Control

# amount of things X
# cargo lost X
# cargo damaged X
# total X
var list_of_things_to_display = {"apples":"5","onions":"50","oranges":"-3"}

var post_line_scene = preload("res://world/briefing/post_line.tscn")



func _ready():
	$Button.visible = false
	assert(!list_of_things_to_display.empty())
	load_summary()
	

func add_line(text_array = []):
	var new_line = post_line_scene.instance()
	new_line.get_node("TextLeft").text = " " + text_array[0]
	new_line.get_node("TextRight").text = " " + text_array[1]
	$PerformanceSummary.add_child(new_line)

	pass

func load_summary():
	for next_thing in list_of_things_to_display:
		#print("next thing is: ",next_thing)
		add_line([" "+next_thing,list_of_things_to_display[next_thing]])
		$PerformanceSummary.add_child($PerformanceSummary/Seperator.duplicate())
		yield(get_tree().create_timer(0.8),"timeout")
	
	#yield(get_tree().create_timer(0.8),"timeout")
	$Button.visible = true
	pass



func show_current_balance():
	$CurrentBalance.text = "Current balance: " + String(GM.current_balance)
	pass


func _on_Button_pressed():
	pass # Replace with function body.
