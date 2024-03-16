extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func door_error():
	print("error: cant open both doors")
	pass

func _on_Right_pressed():
	if !$DoorLeft.visible:
		door_error()
		return
	$DoorRight.visible = !$DoorRight.visible
	$DoorRight/Collider.disabled = !$DoorRight/Collider.disabled
	if !$DoorRight.visible:
		for cargo in $VacumOfSpace.get_overlapping_bodies():
			cargo.apply_central_impulse(Vector2(-100,-50)) # otherwise the get stuck sleeping maybe?
		$VacumOfSpace.space_override = Area2D.SPACE_OVERRIDE_REPLACE
	else:
		$VacumOfSpace.space_override = Area2D.SPACE_OVERRIDE_DISABLED
	pass # Replace with function body.


func _on_Left_pressed():
	if !$DoorRight.visible:
		door_error()
		return
	$DoorLeft.visible = !$DoorLeft.visible
	$DoorLeft/Collider.disabled = !$DoorLeft/Collider.disabled
	pass # Replace with function body.
