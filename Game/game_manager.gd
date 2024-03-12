extends Node

# stores game progress



# manages switching between scenes levels

var current_text_printer


func load_briefing():
	pass

func lost_fired():
	get_tree().change_scene_to(load("res://world/lost/lose_screen_fired.tscn")) 
	pass

func lost_space():
	get_tree().change_scene_to(load("res://world/lost/lose_screen_space.tscn")) 
	pass
