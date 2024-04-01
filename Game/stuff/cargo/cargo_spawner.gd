extends Node2D

var barrel_scene = preload("res://stuff/cargo/barrel.tscn")

var crate_scene = preload("res://stuff/cargo/crate.tscn")

var parasite_scene = preload("res://stuff/parasite.tscn")

var contraband_scene = preload("res://stuff/contraband.tscn")

# Called when the node enters the scene tree for the first time.

func spawn_barrels(amount : int, infested = 0, special = 0):
	var all_barrels = []
	
	var top_slots = $UpperSpawn.get_children()
	
	for A in amount:
		all_barrels.push_back(create_cargo(barrel_scene,top_slots.pop_front().global_position))
	
	if infested != 0:
		
		#print("do infesting stuff and exclude cargo from list as it goes")
		for i in infested:
			var parasite = parasite_scene.instance()
			var pick = randi() % all_barrels.size()
			all_barrels[pick].add_child(parasite)
			all_barrels.remove(pick)
	
	if special != 0:
		print("do special stuff and exclude cargo from list as it goes")
	
	pass

func spawn_crates(amount : int, infested = 0, special = 0):
	var all_crates = []
	
	var bot_slots = $LowerSpawn.get_children()
	
	for A in amount:
		all_crates.push_back(create_cargo(crate_scene,bot_slots.pop_front().global_position))
		
	if infested != 0:
		print("do infesting stuff and exclude cargo from list as it goes")
	
	if special != 0:
		print("do special stuff and exclude cargo from list as it goes")
	

func _ready():
	

#	if level > 2 :
#		$DaySpecificStuff/ExtraShelf.queue_free()
#		var elevator = elevator_scene.instance()
#		elevator.position = $DaySpecificStuff/PlaceElevatorHere.position
#		add_child(elevator)
#		$DaySpecificStuff/BottomBlackout.queue_free()
	pass
		




func create_cargo(cargo : PackedScene, location : Vector2):
	var new_cargo = cargo.instance()

	new_cargo.global_position = location
	add_child(new_cargo)
	return new_cargo
	pass

