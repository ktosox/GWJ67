extends RichTextLabel

var all_voice_lines = {"test" : "testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes",
"day2" : "We specialize in express transport of live cargo! Your job will be inspecting the cargo mid flight for any parasites. Dump any infested cargo through the airlock, preferably before stuff starts crawling out of it.",
"day1" : "Welcome aboard! We need to launch immediatly to meet the delivery deadline, so I'll explain your role on our next brieinfing. I already checked the cargo, but feel free to try out the scanner.",
"day3" : "blahagadfg",
"day4" : "blahagadfg",
"day5" : "blahagadfg",
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
