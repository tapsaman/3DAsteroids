extends Node

enum States {
	RUNNING,
	OPENING_MAP,
	OPEN_MAP,
	EXITING_MAP
}

var state = States.RUNNING

func _process(delta):
	match state:
		States.RUNNING:
			if Input.is_action_just_pressed("open_map"):
				print("open_map")
				get_tree().paused = true
				state = States.OPENING_MAP

		States.OPEN_MAP:
			if Input.is_action_just_pressed("cancel"):
				print("cancel")
				state = States.EXITING_MAP
				
