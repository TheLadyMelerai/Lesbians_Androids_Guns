extends Node

signal startGame()
signal quitGame()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$MenuVisHan.setup()
	$MenuAudHan.setup()

func displayInitialScene():
	$MenuVisHan.displayTeamSplash()
	$MenuAudHan.playTeamSplash()
	await get_tree().create_timer(1.0).timeout
	self.displayMainMenu()

func displayMainMenu():
	$MenuVisHan.displayMainMenu()
	$MenuAudHan.playMainMenu()

func displayCredits():
	$MenuVisHan.displayCredits()

func displayOptions():
	$MenuVisHan.displayOptions()

func _on_menu_vis_han_start_game_pressed():
	$MenuVisHan.cleanUp()
	$MenuAudHan.cleanUp()
	startGame.emit()

func _on_menu_vis_han_quit_game_pressed():
	quitGame.emit()
