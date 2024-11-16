extends Control

signal startGamePressed()
signal quitGamePressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	clearScreen()
	show()

func displayMenuScene(state):
	self.clearScreen()
	match state:
		0:
			$TeamSplash.visible = true
		1:
			$MainMenuBG.visible = true
			$StartGameB.visible = true
			$OptionsB.visible = true
			$CreditsB.visible = true
			$QuitB.visible = true
		2:
			$OptionsBG.visible = true
			$BackB.visible = true
		3:
			$CreditsBG.visible = true
			$BackB.visible = true

func clearScreen():
	for n in self.get_children():
		n.visible = false

func displayTeamSplash():
	self.displayMenuScene(0)

func displayMainMenu():
	self.displayMenuScene(1)

func displayOptions():
	self.displayMenuScene(2)

func displayCredits():
	self.displayMenuScene(3)

func cleanUp():
	self.clearScreen()

func _on_start_game_b_pressed():
	startGamePressed.emit()

func _on_options_b_pressed():
	self.displayOptions()

func _on_credits_b_pressed():
	self.displayCredits()

func _on_back_b_pressed():
	self.displayMainMenu()

func _on_quit_b_pressed():
	quitGamePressed.emit()
