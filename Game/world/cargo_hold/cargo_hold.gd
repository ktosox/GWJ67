extends Node2D


export var travel_speed = 1.0

var distance_traveled = 0

var cargo_state = []

var starting_cargo_top = {
	1 : [1,1,1,1,0,0,0,0],
	2 : [1,1,1,1,1,1,0,0],
	3 : [1,1,1,1,1,1,0,0],
}


var elevator_scene = preload("res://stuff/gravity_elevator.tscn")

var barrel_scene = preload("res://stuff/cargo/barrel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	load_level()
	pass # Replace with function body.



func load_level():
	var level = GM.current_day

	if level > 2 :
		$DaySpecificStuff/ExtraShelf.queue_free()
		var elevator = elevator_scene.instance()
		elevator.position = $DaySpecificStuff/PlaceElevatorHere.position
		add_child(elevator)
		$DaySpecificStuff/BottomBlackout.queue_free()
	var desired_top_cargo = starting_cargo_top[level]
	var top_slots = $UpperCargoSpawn.get_children()
	while desired_top_cargo.size() > 0 :
		create_cargo(desired_top_cargo.pop_front(),top_slots.pop_front().global_position)
		
			
			
	if level > 1:
		var all_cargo = get_tree().get_nodes_in_group("Cargo")
		var parasite = load("res://stuff/parasite.tscn").instance()
		all_cargo[randi()%all_cargo.size()].add_child(parasite)
	pass

func end_travel():
	GM.load_post_briefing()

	
	pass

func create_cargo(type : int, location : Vector2):
	if type == 0:
		return
	var new_cargo
	match type:
		
		1:
			new_cargo = barrel_scene.instance()
	new_cargo.global_position = location
	add_child(new_cargo)

func calculate_cargo_state():
	var all_cargo = get_tree().get_nodes_in_group("Cargo")
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance_traveled += delta * travel_speed
	$TextureProgress.value = distance_traveled
	if distance_traveled > 100:
		end_travel()
	pass


func _on_Button_pressed():
	$TimeSkip.sleep()
	pass # Replace with function body.
