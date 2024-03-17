extends RichTextLabel

var all_voice_lines = {"test" : "testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes",
"day1" : "Welcome aboard the Bloodsucker! We specialize in express transport of live cargo! Your job will be scanning the cargo mid flight, and dumping any infested cargo through the airlock!",
"day2" : "blahagadfg",
"day3" : "blahagadfg",
} # key paired with text



# Called when the node enters the scene tree for the first time.
func _ready():
	GM.current_text_printer = self
	
	
	pass # Replace with function body.

func play_line(key):
	print_text(all_voice_lines[key])
	
	pass

func print_text(new_text : String):
	text = new_text
	
	$Animator.playback_speed = 30.0/text.length() # adjust text playback speed based on character count
	
	$Animator.play("Load")
	$Start.play()
	pass


func _input(event):
	if event.is_action_pressed("ui_accept") and $Animator.is_playing() :
		$Animator.stop()
		$Animator.play("Skip")
		$End.play()



func _on_Animator_animation_finished(anim_name):
	if anim_name == "Load":
		$End.play()
	pass # Replace with function body.
