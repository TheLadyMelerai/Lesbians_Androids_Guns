extends Area2D

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	#position = position.clamp($LowBound.position, $HighBound.position)
	if velocity.x < 0:
		self.displayModel(0)
	elif velocity.x > 0:
		self.displayModel(1)
	if velocity.y < 0:
		self.displayModel(3)
	elif velocity.y > 0:
		self.displayModel(2)
	if velocity.x == 0 and velocity.y == 0:
		self.displayModel(2)

func setup(pos):
	position = pos
	self.clearModel()
	$BoundaryBox.disabled = true
	$BoundaryBox.visible = false

func enableCha(pos):
	position = pos
	show()
	self.displayModel(2)
	$BoundaryBox.set_deferred("disabled", false)

func disableCha():
	self.clearModel()
	hide()
	$BoundaryBox.set_deferred("disabled", true)

func displayModel(state):
	self.clearModel()
	match state:
		0:
			$ModelLeft.visible = true
		1:
			$ModelRight.visible = true
		2: 
			$ModelDown.visible = true
		3:
			$ModelUp.visible = true

func clearModel():
	$ModelDown.visible = false
	$ModelLeft.visible = false
	$ModelRight.visible = false
	$ModelLeft.visible = false

func moveModel(pos):
	self.disableCha()
	self.enableCha(pos)
	print("Moving Char to ", pos.x, " ", pos.y)
