class_name GameStateExitingMap
extends State

var passedTime = 0.0
const transitionTime = 1.0

func update(delta: float) -> void:
	passedTime += delta
	Game.player.scale -= (Game.playerMapScale - Game.player.defaultScale) / 1.0 * delta

	if passedTime > transitionTime:
		state_machine.transition_to("Running")
		passedTime = 0.0
