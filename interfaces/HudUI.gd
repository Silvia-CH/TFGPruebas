extends CanvasLayer
signal pause
signal unpause
signal commands_changed(text)

var is_paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if Input.is_action_just_pressed("enter") and is_paused:
			$Show.text = $TextEdit.text
			commands_changed.emit($TextEdit.text)
			$TextEdit.hide()
			$ColorRect.hide()
			unpause.emit()
			is_paused = false
		elif (Input.is_action_just_pressed("pause") and is_paused):
			$TextEdit.hide()
			$ColorRect.hide()
			unpause.emit()
			is_paused = false
		elif Input.is_action_just_pressed("pause") and not is_paused:
			$TextEdit.show()
			$ColorRect.show()
			$TextEdit.grab_focus()
			pause.emit()
			is_paused = true
			$TextEdit.text = ""

func _on_enter_pressed():
	$Show.text = $TextEdit.text
	commands_changed.emit($TextEdit.text)


func _on_clear_pressed():
	$Show.text = "" 
	$TextEdit.text = ""
	
