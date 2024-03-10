extends Node2D

export var in_speed = 0.4
export var mid_speed = -0.4
export var out_speed = 0.8


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$center/OutRing.rotation += 1 + randf()
	$center/MiddleRing.rotation += $center/OutRing.rotation + 1 + randf()
	$center/InnerRing.rotation += $center/MiddleRing.rotation + 1 + randf()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$center/OutRing.rotation += delta * out_speed
	$center/MiddleRing.rotation += delta * mid_speed
	$center/InnerRing.rotation += delta * in_speed
	pass
