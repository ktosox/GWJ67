extends Area2D


var parasite_scene = load("res://stuff/parasite.tscn")

var bonus_spread_chance = -10

# Called when the node enters the scene tree for the first time.
func _ready():
	$SpreadRange.shape = CircleShape2D.new() # adding this in since "make unique" dosent seem to work
	assert(get_parent().is_in_group("Cargo"))
	get_parent().set_meta("infested", true)
	get_parent().modulate = ColorN("green")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spread(host : RigidBody2D):
	var new_parasite = parasite_scene.instance()

	host.add_child(new_parasite)
	pass

func is_cargo_valid(cargo : RigidBody2D) -> bool :
	assert(cargo.is_in_group("Cargo"))
	# check if cargo is a valid host
		
	# check if cargo is already taken
	if cargo.get_meta("infested"):
		return false
	
	return true
	pass

func scan_for_hosts():
	var all_cargo_in_range = get_overlapping_bodies()
	var valid_cargo = []
	
	for cargo in all_cargo_in_range:
		if is_cargo_valid(cargo):
			valid_cargo.push_back(cargo)
	
	if valid_cargo.size() == 0 :
		print("nothing in spread range")
	else:
		for cargo in valid_cargo:
			
			if (randi() % 30) + bonus_spread_chance > 19 :
				print("sucesful spread")
				spread(cargo)
				bonus_spread_chance -= 8
				return
			else:
				print("spread failed")
				bonus_spread_chance += 1
	bonus_spread_chance += 2
	print("bonus spread chance is now: ",bonus_spread_chance)
	pass


func _on_LifeCycle_animation_finished(anim_name):
	match anim_name:
		"Spawn":
			$LifeCycle.play("Adult")
			
		"Adult":
			$LifeCycle.play("Old")
	pass # Replace with function body.


func _on_SpreadTimer_timeout():
	scan_for_hosts()
	pass # Replace with function body.
