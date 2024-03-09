extends Node2D

export var goodSegmentCount = 4

export var ring_speed = 0.84

var gun_ready = true

var bullet_scene = preload("res://test/ring_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for segment in $Ring.get_children():
		segment.connect("segment_hit",self,"segement_hit_detection")
		pass

	
	var all_segments = $Ring.get_children()
	while goodSegmentCount > 0 :
		var selected_segment = randi()%all_segments.size()
		all_segments[selected_segment].make_good()
		all_segments.remove(selected_segment)
		goodSegmentCount -= 1
		
	pass # Replace with function body.

func segement_hit_detection(is_good : bool):
	print("segment good hit: ",is_good)
	pass

func fire_bullet():
	gun_ready = false
	var new_bullet = bullet_scene.instance()
	new_bullet.global_position = $Muzzle.global_position
	add_child(new_bullet)
	
	$GunCooldownTimer.start()
	pass

func _physics_process(delta):
	$Ring.rotation += delta * ring_speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event : InputEvent):
	if event.is_action_pressed("ui_accept") and gun_ready:
		fire_bullet()
		


func _on_GunCooldownTimer_timeout():
	gun_ready = true
	pass # Replace with function body.
