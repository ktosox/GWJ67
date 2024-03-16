extends Node2D


export var travel_speed = 5 

var distance_traveled = 0

var cargo_state = []

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	pass # Replace with function body.


func end_travel():
	GM.load_post_briefing()
	print("switching to end screen")
	
	pass

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
