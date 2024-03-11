extends DampedSpringJoint2D

signal dragging(state)

signal selected(state)

var drag = false


	
func _physics_process(delta):
	
	if drag:
		
		$GrabbyPart.global_position = get_global_mouse_position()
		$TractorBeam.points[1] = to_local(get_global_mouse_position())
		$TractorBeam.width = 26 - ($GrabbyPart.global_position.distance_to(global_position) * 0.2)
		if $TractorBeam.width < 2:
			drag_ended()
		
		

func drag_ended():
	emit_signal("dragging",false)
	drag = false
	$TractorBeam.points[1] = Vector2.ZERO
	node_a = NodePath()
	$GrabbyPart.global_position = global_position
	pass

func _input(event):
	if event.is_class("InputEventMouseButton") and drag:
		if event.button_index == 1 and !event.is_pressed():
			drag_ended()
			if(!$MouseDetector.get_rect().has_point(get_local_mouse_position())):
				yield(get_tree().create_timer(0.05), "timeout")
				_on_MouseDetector_mouse_exited()




func _on_MouseDetector_gui_input(event):
	if event.is_class("InputEventMouseButton") and !drag :
		if event.button_index == 1 and event.is_pressed():
			drag = true
			node_a = $GrabbyPart.get_path()
			emit_signal("dragging",true)

	pass # Replace with function body.


func _on_MouseDetector_mouse_entered():
	emit_signal("selected",true)
	pass # Replace with function body.


func _on_MouseDetector_mouse_exited():
	emit_signal("selected",false)
	pass # Replace with function body.
