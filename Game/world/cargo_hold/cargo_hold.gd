extends Node2D


export var travel_speed = 1.0

var distance_traveled = 0

var cargo_state = []

var starting_cargo_top = {
	1 : {"barrel": [4,0,0], "crate": [0]}, # type of cargo with an array [amount,infested,special]
	2 : {"barrel": [6,1,0], "crate": [0]},
	3 : {"barrel": [7,1,2], "crate": [0]},
	4 : {"barrel": [5,1,2], "crate": [2,0,1]},
	5 : {"barrel": [6,1,0], "crate": [3,1,0]},
	6 : {"barrel": [7,1,2], "crate": [3,1,1]},
}
var starting_cargo_amount = 0

var elevator_scene = preload("res://stuff/gravity_elevator.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	load_level()
	pass # Replace with function body.



func load_level():
	var level = starting_cargo_top[GM.current_day]
	var barrel_data = level["barrel"]
	var crate_data = level["crate"]
	if barrel_data[0] != 0:
		$CargoSpawner.spawn_barrels(barrel_data[0],barrel_data[1],barrel_data[2])
	if crate_data[0] != 0:
		$CargoSpawner.spawn_crates(crate_data[0],crate_data[1],crate_data[2])
	pass

func end_travel():
	calculate_cargo_state()
	Engine.time_scale = 1.0
	GM.load_post_briefing()

	
	pass



func calculate_cargo_state():
	print(starting_cargo_amount)
	var all_cargo = get_tree().get_nodes_in_group("Cargo")
	var infested_cargo = []
	for cargo in all_cargo:
		if cargo.get_meta("infested"):
			infested_cargo.push_back(cargo)
	var cargo_lost = starting_cargo_amount - all_cargo.size()
	var money_gained = 20 + 5 * all_cargo.size() - (10 * cargo_lost) - (5 * infested_cargo.size())
	var list_of_things_to_display = {}
	list_of_things_to_display["cargo infested"] = String(-infested_cargo.size())
	list_of_things_to_display["cargo lost"] = String(cargo_lost)
	list_of_things_to_display["cargo secured"] = String(all_cargo.size())
	list_of_things_to_display["pay change"] = String(money_gained)
	GM.list_of_things_to_display = list_of_things_to_display.duplicate()
	GM.current_balance += money_gained
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance_traveled += delta * travel_speed
	$TextureProgress.value = distance_traveled
	if distance_traveled > 100:
		end_travel()
	pass


func bump_all(power = 800):
	var all_cargo = get_tree().get_nodes_in_group("Cargo")
	for cargo in all_cargo:
		cargo.apply_impulse(Vector2(rand_range(-10,10),-20),Vector2(0,-1).rotated(randf()-0.5) * power * (2 - randf()) )
	pass


func _on_Button_pressed():
	$TimeSkip.sleep()
	pass # Replace with function body.


func _on_CargoDeleter_body_entered(body):
	
	pass # Replace with function body.


func _on_Button2_pressed():
	bump_all()
	pass # Replace with function body.
