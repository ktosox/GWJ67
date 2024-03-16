extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func flip_gravivty():
	var new_direction = gravity_vec.y * -1
	gravity_vec.y = new_direction
	$Beam.material.set("shader_param/scorll1",Vector2(0,new_direction * -0.385))
	$Beam.material.set("shader_param/scorll2",Vector2(0,new_direction * -0.45))
	for cargo in get_overlapping_bodies():
		cargo.sleeping = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	flip_gravivty()
	pass # Replace with function body.
