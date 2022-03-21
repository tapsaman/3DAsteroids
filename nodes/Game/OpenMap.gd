class_name GameStateOpenMap
extends State

func update(delta: float) -> void:
	if Input.is_action_just_pressed("cancel"):
		state_machine.transition_to("ExitingMap")
