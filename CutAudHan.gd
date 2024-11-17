extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	pass

func cleanUp():
	pass

func playConvoAudio(convoID):
	match convoID:
		0:
			pass
		1:
			pass
		2:
			pass

func playCordBark():
	$CordBark.play()

func playMackBark():
	$MackBark.play()

func playAmieBark():
	$AmieBark.play()

func playCuriBark():
	$CuriBark.play()
