extends CSGMesh

func _on_StaticBody_input_event(camera, event, position, normal, shape_idx):
	if Game.stateMachine.state == GameStateOpenMap and event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			pass
