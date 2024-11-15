extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	pass

func playTrack(state):
	match state:
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

func silenceAudio():
	for n in self.get_children():
		n.stop()
