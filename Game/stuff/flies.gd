extends RigidBody2D

var parasite_scene = load("res://stuff/parasite.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$HostDetector/CollisionShape2D.shape = CircleShape2D.new()
	$Tether.length = 4 * randf()
	$Tether.stiffness = 4 * randf()
	$Tether.damping = 3 * randf()
	$Tether.bias = 0.9 * randf()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Flies_body_entered(body):
	if body.is_in_group("Cargo"):
		if !body.get_meta("infested"):
			var new_parasite = parasite_scene.instance()
			new_parasite.get_node("LifeCycle").play("Adult")
			body.add_child(new_parasite)
			self.queue_free()
	pass # Replace with function body.




func _on_Clicky_click():
	print("length: ",$Tether.length,", stiffnes: ",$Tether.stiffness, " damping: ",$Tether.damping," bias: ",$Tether.bias)
	queue_free()
	pass # Replace with function body.


func _on_MoveTimer_timeout():
	var direction = Vector2(0,0)
	var possible_targets = $HostDetector.get_overlapping_bodies()
	for cargo in possible_targets:
		if cargo.get_meta("infested"):
			possible_targets.erase(cargo)
	if possible_targets.size() == 0:
		direction = Vector2(rand_range(-1.0,1.0),1.0)
	else:
		direction = possible_targets[randi()%possible_targets.size()].global_position - global_position
		direction = direction.normalized()
	apply_central_impulse(direction * 200 * randf())
	pass # Replace with function body.
