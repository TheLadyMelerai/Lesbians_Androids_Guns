extends Node

signal enterRoom0()
signal enterRoom1()
signal enterRoom1e()
signal enterRoom2()
signal enterRoom2e()
signal enterRoom3()
signal enterRoom3e()
signal enterRoom4() 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	$Character.setup($SpawnPoint.position)
	$RT0R1L.setup($RT0R1L.getCenterPoint())
	disableRoomTrans()

func clearCha():
	$Character.disableCha()

func spawnCha():
	$Character.enableCha($SpawnPoint.position)
	#$RT0R1L.enableRT()

func disableRoomTrans():
	$RT0R1L.disableRT()
	$RT1L0R.disableRT()
	$RT1R1eL.disableRT()
	$RT1eL1R.disableRT()
	$RT1U2D.disableRT()
	$RT2D1U.disableRT()

#DirCodes: 0=From Left, 1=From Right, 2=From Up, 3=From Down
func moveRoomCha(newRoomCode, dirCode):
	disableRoomTrans()
	match newRoomCode:
		0:
			$Character.moveModel($SP0FR.position)
			#$RT0R1L.enableRT()
			print("Enter Room 0")
		1:
			if dirCode == 0:
				$Character.moveModel($SP1FL.position)
			elif dirCode == 1:
				$Character.moveModel($SP1FR.position)
			elif dirCode == 2:
				$Character.moveModel($SP1FU.position)
			#$RT1L0R.enableRT()
			#$RT1R1eL.enableRT()
			#$RT1U2D.enableRT()
			print("Enter Room 1")
		2:
			$Character.moveModel($SP1eFL.position)
			#$RT1eL1R.enableRT()
			print("Enter Room 1e")
		3:
			if dirCode == 0:
				pass
			elif dirCode == 2:
				pass
			elif  dirCode == 3:
				$Character.moveModel($SP2FD.position)
			#$RT2D1U.enableRT()
			print("Enter Room 2")
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass

func _on_rt_0r_1l_player_entered_area():
	enterRoom1.emit()
	moveRoomCha(1,0)
	print("0r - 1l")

func _on_rt_1l_0r_player_entered_area():
	enterRoom0.emit()
	moveRoomCha(0,1)
	print("1l - Or")

func _on_rt_1r_1e_l_player_entered_area():
	enterRoom1e.emit()
	moveRoomCha(2,0)
	print("1r - 1el")

func _on_rt_1e_l_1r_player_entered_area():
	enterRoom1.emit()
	moveRoomCha(1,1)
	print("1el - 1r")

func _on_rt_1u_2d_player_entered_area():
	enterRoom2.emit()
	moveRoomCha(3,4)
	print("1u - 2d")

func _on_rt_2d_1u_player_entered_area():
	enterRoom1.emit()
	moveRoomCha(1,2)
	print("2d - 1u")
