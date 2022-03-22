class_name GameStatePaused
extends State

func enter(_msg := {}) -> void:
	$MainMenu.get_node("Control").visible = true

func exit():
	$MainMenu.get_node("Control").visible = false

func update(delta: float) -> void:
	if Input.is_action_just_pressed("cancel"):
		state_machine.transition_to("Running")
