class_name GameStateOpeningMap
extends State

var passedTime = 0.0
const transitionTime = 1.0

func update(delta: float) -> void:
	passedTime += delta
	if passedTime > transitionTime:
		state_machine.transition_to("OpenMap")
