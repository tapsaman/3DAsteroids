extends Node

onready var stateMachine = get_node("StateMachine")
var player = null # Set by Player node
var playerMapScale = Vector3(10, 10, 10)
