extends StaticBody2D


var cargo_in_scanner = 0

var scanning = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_cargo_count()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start_scan():
	scanning = true
	$ScanSlider/Draggy.visible = false
	
	$ScanSlider/ScanArea/Animator.play("Scan")
	pass

func complete_scan():
	print("scan complete")
	end_scan()
	

func end_scan():
	
	scanning = false
	$ScanSlider/Draggy.visible = true
	$ScanSlider/ScanArea/Animator.play("RESET")
	pass

func scan_valid_check():
	if cargo_in_scanner != 1:
		print("scan error")
		if scanning:
			end_scan()
		return false
		
	return true
	pass


func _on_Button_pressed():
	if scan_valid_check():
		start_scan()
	pass # Replace with function body.

func update_cargo_count():
	cargo_in_scanner = $ScanSlider/ScanArea.get_overlapping_bodies().size()
	if scanning :
		scan_valid_check()

func _on_ScanArea_body_entered(body):
	update_cargo_count()
	
	pass # Replace with function body.


func _on_ScanArea_body_exited(body):
	update_cargo_count()
	pass # Replace with function body.
