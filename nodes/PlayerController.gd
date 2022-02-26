extends Node

var inputVelocity = Vector2.ZERO
var isFiring = false
onready var playerShip = get_node("SpaceShip")

func processInput():
	inputVelocity = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		inputVelocity.y -= 1
	if Input.is_action_pressed("move_right"):
		inputVelocity.x += 1
	if Input.is_action_pressed("move_down"):
		inputVelocity.y += 1
	if Input.is_action_pressed("move_left"):
		inputVelocity.x -= 1

	inputVelocity = inputVelocity.normalized()

	isFiring = Input.is_action_pressed("fire");

func _process(delta):
	processInput()
