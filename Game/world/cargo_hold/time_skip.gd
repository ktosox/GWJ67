extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func sleep():
	if $Animator.is_playing():
		return
	$MouseBlock.mouse_filter = Control.MOUSE_FILTER_STOP
	$Animator.play("close")
	
	pass


func wake():
	$MouseBlock.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Animator_animation_finished(anim_name):
	if anim_name == "close":
		Engine.time_scale = 8
		$SleepTimer.start()
	if anim_name == "open":
		wake()
	pass # Replace with function body.


func _on_SleepTimer_timeout():
	Engine.time_scale = 1 
	$Animator.play("open")
	pass # Replace with function body.
