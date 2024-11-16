extends Area2D

signal playerEnteredArea()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup(pos):
	position = pos
	$ColorRect.visible = false
	$CollisionShape2D.visible = false
	$CollisionShape2D.disabled = true

func enableRT():
	$ColorRect.visible = true
	$CollisionShape2D.set_deferred("disabled", false)
	show()

func disableRT():
	hide()
	$ColorRect.visible = false
	$CollisionShape2D.set_deferred("disabled", true)

func getCenterPoint():
	return $Marker2D.position

func _on_area_entered(area):
	self.disableRT()
	playerEnteredArea.emit()
