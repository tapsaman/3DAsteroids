extends NinePatchRect

func _on_ContinueButton_pressed():
	onContinue()

func _on_QuitButton_pressed():
	onQuit()

func onContinue():
	Game.stateMachine.transition_to("Running")

func onQuit():
	get_tree().quit()
