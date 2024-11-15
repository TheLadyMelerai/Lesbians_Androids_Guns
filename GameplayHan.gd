extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup():
	$GameVisHan.setup()
	$GameChaHan.setup()
	$GameAudHan.setup()

func cleanUp():
	$GameVisHan.clearScreen()
	$GameChaHan.clearCha()
	$GameAudHan.silenceAudio()

func startGameplay(state):
	$GameVisHan.displayRoom(1)
	$GameChaHan.displayCharacter(0)
	$GameAudHan.playTrack(0)
