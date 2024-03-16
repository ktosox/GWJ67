extends RichTextLabel

var all_voice_lines = {"test": "testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes; testing the text printer for testing purposes"} # key paired with text



# Called when the node enters the scene tree for the first time.
func _ready():
	GM.current_text_printer = self
	play_line("test")
	pass # Replace with function body.

func play_line(key):
	print_text(all_voice_lines[key])
	
	pass

func print_text(new_text : String):
	text = new_text
	
	$Animator.playback_speed = 30.0/text.length() # adjust text playback speed based on character count
	
	$Animator.play("Load")
	pass


func _input(event):
	if event.is_action_pressed("ui_accept") and $Animator.is_playing() :
		$Animator.stop()
		$Animator.play("Skip")

