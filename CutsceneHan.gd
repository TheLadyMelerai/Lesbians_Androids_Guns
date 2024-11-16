extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$CutVisHan.setup()
	$CutAudHan.setup()

func cleanUp():
	$CutVisHan.cleanUp()
	$CutAudHan.cleanUp()

func displayVisualNovel(convoID):
	var leftChar = self.getConvoLeftChar(convoID)
	var rightChar = self.getConvoRightChar(convoID)
	$CutVisHan.displayConvoScene(leftChar, rightChar)
	$CutAudHan.playConvoAudio(convoID)
	$CutVisHan.displayDialog(convoID)

func getConvoLeftChar(_convoID):
	return 0

func getConvoRightChar(convoID):
	match convoID:
		1:
			return 1
		2:
			return 1
		3:
			return 1
		4:
			return 1
		5:
			return 1
		6:
			return 1
		7:
			return 1
		8:
			return 1
		9:
			return 1
		10:
			return 1
		11:
			return 1
		12:
			return 1
