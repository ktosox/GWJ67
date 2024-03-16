extends Node

# stores game progress
var current_balance = 0

var current_day = 0

# manages switching between scenes levels

var pre_briefing_scene = preload("res://world/briefing/pre_briefing.tscn")

var post_briefing_scene = preload("res://world/briefing/post_briefing.tscn")

var current_text_printer

func _ready():
	pass


func load_pre_briefing(level = -1):
	if level == -1 :
		current_day += 1
	else:
		current_day = level
	get_tree().change_scene_to(pre_briefing_scene)
	
	
	pass

func load_post_briefing(cargo_result = []):
	assert(!cargo_result.empty())
	
	pass


func lost_fired():
	get_tree().change_scene_to(load("res://world/lost/lose_screen_fired.tscn")) 
	pass

func lost_space():
	get_tree().change_scene_to(load("res://world/lost/lose_screen_space.tscn")) 
	pass
