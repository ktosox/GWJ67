extends Node2D


export var travel_speed = 5 

var distance_traveled = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func end_travel():
	print("switching to end screen")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance_traveled += delta * travel_speed
	$TextureProgress.value = distance_traveled
	if distance_traveled > 100:
		end_travel()
	pass
