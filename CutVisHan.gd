extends Control

signal returnToGame()

var activeConvo
var activeLine

var convo0 = [["Hi, Cordelia here!", 0], ["Hi, Mackenzie here!", 1]]
var convo1 = [["asdf", 0], ["asdf", 1]]
var convo2 = [["asdf", 0], ["asdf", 1]]

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	clearScreen()

func cleanUp():
	clearScreen()

func clearScreen():
	for n in self.get_children():
		n.visible = false

func displayConvoScene(leftChar, rightChar):
	show()
	self.clearScreen()
	print(rightChar)
	$DialogBG.visible = true
	$TextBacking.visible = true
	if leftChar == 0:
		$Sprite0.visible = true
		$Nameplate0.visible = true
	if rightChar == 1:
		$Sprite1.visible = true
		$Nameplate1.visible = true
	elif rightChar == 2:
		$Sprite2.visible = true
		$Nameplate2.visible = true
	elif rightChar == 3:
		$Sprite3.visible = true
		$Nameplate3.visible = true
	$DialogTextBox.clear()
	$DialogTextBox.visible = true

func displayDialog(convoID):
	activeConvo = convoID
	activeLine = 0
	$DialogTextBox.add_text(self.getActiveConvo(convoID)[0][0])
	chooseActiveTalker(self.getActiveConvo(convoID)[0][1])
	$ContinueB.visible = true

func getActiveConvo(convoID):
	match convoID:
		0:
			return convo0
		1:
			return convo1
		2:
			return convo2

func chooseActiveTalker(talkerID):
	$Nameplate0.visible = false
	$Nameplate1.visible = false
	$Nameplate2.visible = false
	$Nameplate3.visible = false
	match talkerID:
		0:
			$Nameplate0.visible = true
		1:
			$Nameplate1.visible = true
		2:
			$Nameplate2.visible = true
		3:
			$Nameplate3.visible = true

func advanceDialog():
	self.activeLine += 1
	if activeLine < self.getActiveConvo(activeConvo).size():
		$DialogTextBox.clear()
		$DialogTextBox.add_text(self.getActiveConvo(activeConvo)[activeLine][0])
		chooseActiveTalker(self.getActiveConvo(activeConvo)[activeLine][1])
	else:
		cleanUp()
		returnToGame.emit()

func _on_continue_b_pressed():
	advanceDialog()
