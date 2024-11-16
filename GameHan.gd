extends Node

signal quitToMenu()
signal quitGame()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$CutsceneHan.setup()
	$GameplayHan.setup()
	$HAMHan.setup()

func startNewGame():
	$CutsceneHan.cleanUp()
	$HAMHan.cleanUp()
	$GameplayHan.startNewGame()

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

func _on_gameplay_han_quit_to_menu():
	$CutsceneHan.cleanUp()
	$GameplayHan.cleanUp()
	$HAMHan.cleanUp()
	quitToMenu.emit()

func _on_gameplay_han_quit_game():
	quitGame.emit()
