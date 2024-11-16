extends Control

signal PHMenuP()
signal PHQuitP()

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
		1:
			$Room1BG.visible = true
			$Macguffin1.visible = true
			$MonitorModel.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		2:
			$Room1eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		3:
			$Room2BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		4:
			$Room2eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		5:
			$Room3BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		6:
			$Room3eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
		7:
			$Room4BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true

func _on_ph_menu_pressed():
	PHMenuP.emit()

func _on_ph_quit_pressed():
	PHQuitP.emit()
