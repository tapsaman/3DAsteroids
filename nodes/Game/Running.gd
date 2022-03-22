class_name GameStateRunning
extends State

func enter(_msg := {}) -> void:
	get_tree().paused = false

func exit():
	get_tree().paused = true

func update(delta: float) -> void:
	if Input.is_action_just_pressed("open_map"):
		state_machine.transition_to("OpeningMap")
	elif Input.is_action_just_pressed("cancel"):
		state_machine.transition_to("Paused")
