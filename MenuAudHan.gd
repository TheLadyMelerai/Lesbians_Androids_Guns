extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup():
	pass

func playTeamSplash():
	pass

func playMainMenu():
	self.silenceAudio()

func cleanUp():
	self.silenceAudio()

func silenceAudio():
	for n in self.get_children():
		n.stop()
