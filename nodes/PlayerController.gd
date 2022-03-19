extends Node

var inputVelocity = Vector2.ZERO
var isFiring = false
onready var spaceShip = get_node("SpaceShip")
onready var test = get_node("CSGTorus")

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
	spaceShip.moveToVelocity(inputVelocity)
	test.rotation.y = rad2deg(inputVelocity.angle())
	spaceShip.toggleFire(isFiring)
