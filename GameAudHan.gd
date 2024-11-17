extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	pass

func playTrack(trackCode):
	silenceAudio()
	match trackCode:
		0:
			pass
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass

func playRoomTrack(roomCode):
	silenceAudio()
	match roomCode:
		0:
			$Room0.play()
		1:
			$Room1.play()
		2:
			$Room1e.play()
		3:
			$Room2.play()
		4:
			$Room2e.play()
		5:
			$Room3.play()
		6:
			$Room3e.play()
		7:
			$Room4.play()

func silenceAudio():
	for n in self.get_children():
		n.stop()
