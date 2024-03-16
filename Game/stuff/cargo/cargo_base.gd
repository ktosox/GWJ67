class_name CargoBase

extends RigidBody2D

var HP = 100





func _on_Draggy_dragging(state):
	if state:
		
		set_deferred("mode",RigidBody2D.MODE_CHARACTER)
	else:
		set_deferred("mode",RigidBody2D.MODE_RIGID)
	yield(get_tree().create_timer(0.3),"timeout")
	print(mode)
	pass # Replace with function body.
