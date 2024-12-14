extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func disableArea():
	$CollisionShape2D.set_deferred("disabled", true)
	$ColorRect.visible = false

func enableArea():
	$CollisionShape2D.set_deferred("disabled", false)
	$ColorRect.visible = true
