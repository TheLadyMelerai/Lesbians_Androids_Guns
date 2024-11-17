extends Node

signal quitToMenu()
signal quitGame()
signal startConvo(convoID)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$GameVisHan.setup()
	$GameChaHan.setup()
	$GameAudHan.setup()

func cleanUp():
	$GameVisHan.clearScreen()
	$GameChaHan.clearCha()
	$GameAudHan.silenceAudio()

func startNewGame():
	$GameVisHan.displayRoom(0)
	$GameChaHan.spawnCha()
	$GameAudHan.playRoomTrack(0)

func startGameplay(_state):
	$GameVisHan.displayRoom(0)
	$GameChaHan.spawnCha()
	$GameAudHan.playRoomTrack(0)

func swapRoom(newRoomCode):
	$GameVisHan.displayRoom(newRoomCode)
	$GameAudHan.playRoomTrack(newRoomCode)

func _on_game_vis_han_ph_menu_p():
	quitToMenu.emit()

func _on_game_vis_han_ph_quit_p():
	quitGame.emit()

func _on_game_cha_han_enter_room_0():
	swapRoom(0)
	$GameAudHan.playRoomTrack(0)

func _on_game_cha_han_enter_room_1():
	swapRoom(1)
	$GameAudHan.playRoomTrack(1)

func _on_game_cha_han_enter_room_1e():
	swapRoom(2)
	$GameAudHan.playRoomTrack(2)

func _on_game_cha_han_enter_room_2():
	swapRoom(3)
	$GameAudHan.playRoomTrack(3)

func _on_game_cha_han_enter_room_2e():
	swapRoom(4)
	$GameAudHan.playRoomTrack(4)

func _on_game_cha_han_enter_room_3():
	swapRoom(5)
	$GameAudHan.playRoomTrack(5)

func _on_game_cha_han_enter_room_3e():
	swapRoom(6)
	$GameAudHan.playRoomTrack(6)

func _on_game_cha_han_enter_room_4():
	swapRoom(7)
	$GameAudHan.playRoomTrack(7)

func _on_game_vis_han_ph_start_test_dialog():
	startConvo.emit(0)

func _on_game_vis_han_ph_go_to_0():
	$GameAudHan.playRoomTrack(0)

func _on_game_vis_han_ph_go_to_1():
	$GameAudHan.playRoomTrack(1)

func _on_game_vis_han_ph_go_to_1e():
	$GameAudHan.playRoomTrack(1)

func _on_game_vis_han_ph_go_to_2():
	$GameAudHan.playRoomTrack(3)

func _on_game_vis_han_ph_start_test_dialog_1():
	startConvo.emit(1)

func _on_game_vis_han_ph_start_test_dialog_2():
	startConvo.emit(2)
