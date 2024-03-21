extends Node2D

var in_speed = [1.8,1.8]
var mid_speed = [1.8,1.8]
var out_speed = [1.8,1.8]

var current_segment = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$center/OutRing.rotation += 1 + randf()
	$center/MiddleRing.rotation += $center/OutRing.rotation + 1 + randf()
	$center/InnerRing.rotation += $center/MiddleRing.rotation + 1 + randf()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$center/OutRing.rotation += delta * out_speed[0]
	$center/MiddleRing.rotation += delta * mid_speed[0]
	$center/InnerRing.rotation += delta * in_speed[0]

	pass

func swap_segment():

	out_speed[0] = out_speed[1]
	in_speed[0] = in_speed[1]
	mid_speed[0] = mid_speed[1]
	current_segment = (current_segment+1)%3
	$center/OutRing.modulate = ColorN("White")
	$center/InnerRing.modulate = ColorN("White")
	$center/MiddleRing.modulate = ColorN("White")
	match current_segment:
		0:
			
			$center/InnerRing.modulate = ColorN("Pink")
			pass
		1:
			
			$center/MiddleRing.modulate = ColorN("Pink")
			pass
		2:
			
			$center/OutRing.modulate = ColorN("Pink")
			pass
	pass

func press_segment():
	print("press")
	match current_segment:
		0:
			in_speed[0] = 0.0
		1:
			mid_speed[0] = 0.0
		2:
			out_speed[0] = 0.0

func _input(event:InputEvent):
	if event.is_action("ui_accept"):
		if event.is_pressed() and Input.is_action_just_pressed("ui_accept"):
			
			press_segment()
		elif Input.is_action_just_released("ui_accept"):
			swap_segment()


func _on_Line_area_entered(area):
	if $center/MiddleRing/Line.get_overlapping_areas().size() == 2:
		print("win")
	pass # Replace with function body.
