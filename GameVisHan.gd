extends Control

signal PHMenuP()
signal PHQuitP()
signal PHStartTestDialog()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	clearScreen()
	show()

func clearScreen():
	for n in self.get_children():
		n.visible = false

func displayRoom(state):
	clearScreen()
	match state:
		0:
			$Room0BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			$PHStartDialog.visible = true
		1:
			$Room1BG.visible = true
			$Macguffin1.visible = true
			$MonitorModel.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			$PHStartDialog.visible = true
		2:
			$Room1eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
		3:
			$Room2BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
		4:
			$Room2eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
		5:
			$Room3BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
		6:
			$Room3eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
		7:
			$Room4BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true

func _on_ph_menu_pressed():
	PHMenuP.emit()

func _on_ph_quit_pressed():
	PHQuitP.emit()

func _on_ph_go_to_0_pressed():
	displayRoom(0)

func _on_ph_go_to_1_pressed():
	displayRoom(1)

func _on_ph_start_dialog_pressed():
	PHStartTestDialog.emit()
