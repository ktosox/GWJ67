extends RigidBody2D


export var is_good = false

signal segment_hit(good)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func make_good():
	modulate = ColorN("lime")
	is_good = true
	pass

func _on_RingSegment_body_entered(body):

	emit_signal("segment_hit",is_good)
	body.queue_free()
	pass # Replace with function body.
