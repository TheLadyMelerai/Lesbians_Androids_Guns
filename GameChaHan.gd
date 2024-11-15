extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$Character.setup($SpawnPoint.position)

func clearCha():
	$Character.clearModel()

func spawnCha():
	$Character.enableCha($SpawnPoint.position)
