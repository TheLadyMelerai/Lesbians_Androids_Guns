extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	initializeGameState()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func initializeGameState():
	$MenuHan.setup()
	$GameHan.setup()
	$MenuHan.displayInitialScene()

func _on_menu_han_start_game():
	$GameHan.startGame()

func _on_game_han_quit_to_menu():
	$MenuHan.displayMainMenu()
