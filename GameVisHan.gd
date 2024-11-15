extends Control


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
			pass
		1:
			$Room1BG.visible = true
			$Macguffin1.visible = true
			$MonitorModel.visible = true
		2:
			pass
		3:
			pass
		4:
			pass
