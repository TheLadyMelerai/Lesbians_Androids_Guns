extends Control

signal PHMenuP()
signal PHQuitP()
signal PHStartTestDialog()
signal PHStartTestDialog1()
signal PHStartTestDialog2()
signal PHGoTo0()
signal PHGoTo1()
signal PHGoTo1e()
signal PHGoTo2()

var currentRoom
var currentItem
var gameActive
var itemFlag1
var itemFlag2
var itemFlag3
var itemFlag4

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	currentRoom = 0
	currentItem = 0
	gameActive = false
	itemFlag1 = true
	itemFlag2 = true
	itemFlag3 = true
	itemFlag4 = true
	clearScreen()
	show()

func clearScreen():
	for n in self.get_children():
		n.visible = false

func displayRoom(state):
	clearScreen()
	activateGame()
	drawUI()
	match state:
		0:
			$Room0BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			$PHGoTo1e.visible = true
			$PHGoTo2.visible = true
			#$PHStartDialog.visible = true
			#$PHStartDialog1.visible = true
			#$PHStartDialog2.visible = true
			currentRoom = 0
		1:
			$Room1BG.visible = true
			$Macguffin1.visible = itemFlag1
			$MonitorModel.visible = true
			$Herring3.visible = itemFlag3
			$PHMenu.visible = true
			$PHQuit.visible = true
			$Room1DoorLClosed.visible = true
			$Room1DoorUClosed.visible = true
			$Room1DoorRClosed.visible = true
			#$PHGoTo0.visible = true
			#$PHGoTo1.visible = true
			#$PHGoTo1e.visible = true
			#$PHGoTo2.visible = true
			#$PHStartDialog.visible = true
			#$PHStartDialog1.visible = true
			#$PHStartDialog2.visible = true
			currentRoom = 1
		2:
			$Room1eBG.visible = true
			$Herring2.visible = itemFlag2
			$Herring4.visible = itemFlag4
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			$PHGoTo1e.visible = true
			$PHGoTo2.visible = true
			#$PHStartDialog.visible = true
			#$PHStartDialog1.visible = true
			#$PHStartDialog2.visible = true
			currentRoom = 1
		3:
			$Room2BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			$PHGoTo1e.visible = true
			$PHGoTo2.visible = true
			#$PHStartDialog.visible = true
			#$PHStartDialog1.visible = true
			#$PHStartDialog2.visible = true
			currentRoom = 3
		4:
			$Room2eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			currentRoom = 4
		5:
			$Room3BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			currentRoom = 5
		6:
			$Room3eBG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			currentRoom = 6
		7:
			$Room4BG.visible = true
			$PHMenu.visible = true
			$PHQuit.visible = true
			$PHGoTo0.visible = true
			$PHGoTo1.visible = true
			currentRoom = 7

func drawUI():
	$InvArea.visible = true
	match currentItem:
		0:
			pass
		1:
			$InvItem1.visible = true
		2:
			$InvItem2.visible = true
		3:
			$InvItem3.visible = true
		4:
			$InvItem4.visible = true

func interact(pos):
	if gameActive:
		if currentItem == 0:
			match currentRoom:
				0:
					pass
				1:
					if pos.x >= 1700 and pos.x <= 1820 and pos.y >= 70 and pos.y <= 180 and itemFlag1:
						pickUpItem(1)
						$Macguffin1.visible = false
						itemFlag1 = false
					if pos.x >= 500 and pos.x <= 720 and pos.y >= 0 and pos.y <= 280:
						deactivateGame()
						PHStartTestDialog.emit()
					if pos.x >= 800 and pos.x <= 920 and pos.y >= 690 and pos.y <= 800 and itemFlag3:
						pickUpItem(3)
						$Herring3.visible = false
						itemFlag3 = false
				2:
					if pos.x >= 800 and pos.x <= 920 and pos.y >= 350 and pos.y <= 440 and itemFlag2:
						pickUpItem(2)
						$Herring2.visible = false
						itemFlag2 = false
					if pos.x >= 1380 and pos.x <= 1500 and pos.y >= 350 and pos.y <= 440 and itemFlag4:
						pickUpItem(4)
						$Herring4.visible = false
						itemFlag4 = false
		elif currentItem <= 4:
			if currentRoom == 1:
				if pos.x >= 500 and pos.x <= 720 and pos.y >= 0 and pos.y <= 280:
					match currentItem:
						1:
							dropItem()
							deactivateGame()
							PHStartTestDialog1.emit()
						2:
							dropItem()
							deactivateGame()
							PHStartTestDialog2.emit()
						3:
							dropItem()
							deactivateGame()
							PHStartTestDialog2.emit()
						4:
							dropItem()
							deactivateGame()
							PHStartTestDialog2.emit()
				else:
					pass
			else:
				pass
		else:
			pass
	else:
		pass

func pickUpItem(itemCode):
	currentItem = itemCode
	drawUI()

func dropItem():
	currentItem = 0
	drawUI()

func activateGame():
	gameActive = true

func deactivateGame():
	gameActive = false

func getCurrentRoom():
	return currentRoom

func _on_ph_menu_pressed():
	PHMenuP.emit()

func _on_ph_quit_pressed():
	PHQuitP.emit()

func _on_ph_go_to_0_pressed():
	displayRoom(0)
	PHGoTo0.emit()

func _on_ph_go_to_1_pressed():
	displayRoom(1)
	PHGoTo1.emit()

func _on_ph_start_dialog_pressed():
	PHStartTestDialog.emit()

func _on_ph_go_to_1e_pressed():
	displayRoom(2)
	PHGoTo1e.emit()

func _on_ph_go_to_2_pressed():
	displayRoom(3)
	PHGoTo2.emit()

func _on_ph_start_dialog_1_pressed():
	PHStartTestDialog1.emit()

func _on_ph_start_dialog_2_pressed():
	PHStartTestDialog2.emit()
