extends Node

signal quitToMenu()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup():
	$CutsceneHan.setup()
	$GameplayHan.setup()
	$HAMHan.setup()

func startGame():
	self.cutToGameplay(0)

func cutToGameplay(gameState):
	$CutsceneHan.cleanUp()
	$HAMHan.cleanUp()
	$GameplayHan.startGameplay(gameState)

func cutToCutscene(gameState):
	$GameplayHan.cleanUp()
	$HAMHan.cleanUp()
	$CutsceneHan.playCutscene(gameState)

func cutToHAM(gameState):
	$CutsceneHan.cleanUp()
	$GameplayHan.cleanUp()
	$HAMHan.startHAM(gameState)

