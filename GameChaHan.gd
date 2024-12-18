extends Node

signal enterRoom0()
signal enterRoom1()
signal enterRoom1e()
signal enterRoom2()
signal enterRoom2e()
signal enterRoom3()
signal enterRoom3e()
signal enterRoom4()
signal interactPressed(pos) 

var currentRoom

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$Character.setup($SpawnPoint.position)
	currentRoom = 0
	disableRoomTrans()
	disableInvsWalls()
	disableRTArea()

func clearCha():
	$Character.disableCha()

func spawnCha():
	$Character.enableCha($SpawnPoint.position)
	enableInvsWall(0)
	enableRTArea(0)

func spawnChaAt(pos):
	$Character.enableCha(pos)

func spawnChaAtMack():
	$Character.enableCha($MackSpawn.position)

func disableRoomTrans():
	pass

#DirCodes: 0=From Left, 1=From Right, 2=From Up, 3=From Down
func moveRoomCha(newRoomCode, dirCode):
	disableRoomTrans()
	disableInvsWalls()
	disableRTArea()
	match newRoomCode:
		0:
			$Character.moveModel($Sp0E.position)
			print("Enter Room 0")
			currentRoom = 0
		1:
			if dirCode == 0:
				$Character.moveModel($Sp1W.position)
			elif dirCode == 1:
				$Character.moveModel($Sp1E.position)
			elif dirCode == 2:
				$Character.moveModel($Sp1N.position)
			else:
				print("Room Transition Error")
			print("Enter Room 1")
			currentRoom = 1
		2:
			$Character.moveModel($Sp1eW.position)
			print("Enter Room 1e")
			currentRoom = 2
		3:
			if dirCode == 0:
				$Character.moveModel($Sp2W.position)
			elif dirCode == 2:
				$Character.moveModel($Sp2N.position)
			elif  dirCode == 3:
				$Character.moveModel($Sp2S.position)
			print("Enter Room 2")
			currentRoom = 3
		4:
			$Character.moveModel($Sp2eE.position)
			print("Enter Room 2e")
			currentRoom = 4
		5:
			pass
		6:
			pass
		7:
			pass
		_:
			pass
	enableInvsWall(newRoomCode)
	enableRTArea(newRoomCode)

func disableInvsWalls():
	for n in $WallMap0.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap1.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap1e.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap2.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap2e.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap3.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap3e.get_children():
		n.set_deferred("disabled", true)
	for n in $WallMap4.get_children():
		n.set_deferred("disabled", true)

func enableInvsWall(roomID):
	disableInvsWalls()
	match roomID:
		0:
			for n in $WallMap0.get_children():
				n.set_deferred("disabled", false)
		1:
			for n in $WallMap1.get_children():
				n.set_deferred("disabled", false)
		2:
			for n in $WallMap1e.get_children():
				n.set_deferred("disabled", false)
		3:
			for n in $WallMap2.get_children():
				n.set_deferred("disabled", false)
		4:
			for n in $WallMap2e.get_children():
				n.set_deferred("disabled", false)
		5:
			for n in $WallMap3.get_children():
				n.set_deferred("disabled", false)
		6:
			for n in $WallMap3e.get_children():
				n.set_deferred("disabled", false)
		7:
			for n in $WallMap4.get_children():
				n.set_deferred("disabled", false)

func disableRTArea():
	$RT0E.disableArea()
	$RT1W.disableArea()
	$RT1N.disableArea()
	$RT1E.disableArea()
	$RT1eW.disableArea()
	$RT2S.disableArea()
	$RT2W.disableArea()
	$RT2N.disableArea()
	$RT2eE.disableArea()

func enableRTArea(roomID):
	disableRTArea()
	match roomID:
		0:
			$RT0E.enableArea()
		1:
			$RT1W.enableArea()
			$RT1N.enableArea()
			$RT1E.enableArea()
		2:
			$RT1eW.enableArea()
		3:
			$RT2S.enableArea()
			$RT2W.enableArea()
			$RT2N.enableArea()
		4:
			$RT2eE.enableArea()
		5:
			pass
		6:
			pass
		7:
			pass

func _on_character_interact_pressed(pos):
	interactPressed.emit(pos)

#DirCodes: 0=From Left, 1=From Right, 2=From Up, 3=From Down
func _on_rt_0e_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	disableInvsWalls()
	moveRoomCha(1, 0)
	enterRoom1.emit()

func _on_rt_1w_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	disableInvsWalls()
	moveRoomCha(0, 1)
	enterRoom0.emit()

func _on_rt_1n_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	disableInvsWalls()
	moveRoomCha(3, 3)
	enterRoom2.emit()

func _on_rt_1e_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	disableInvsWalls()
	moveRoomCha(2, 0)
	enterRoom1e.emit()

func _on_rt_1e_w_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	disableInvsWalls()
	moveRoomCha(1, 1)
	enterRoom1.emit()
