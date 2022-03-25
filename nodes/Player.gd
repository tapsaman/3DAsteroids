extends KinematicBody

var bulletScene = preload("res://nodes/Bullet.tscn")
var input = Vector2.ZERO
var velocity : Vector3
export (int) var acceleration = 8
export (int) var maxSpeed = 10

var rotationDirection : int
export (float) var rotationSpeed = 3.5
export (float) var frictionWeight = 0.02
var fireWait : float = 0
export (float) var fireTimeout = 0.333
var bulletCount = 0
onready var scene = get_parent().get_node("Scene")
onready var fireParticles = get_node("Fire").get_node("Particles")
onready var gun1 = get_node("Gun1")
onready var gun2 = get_node("Gun2")
var defaultScale = null

func _ready():
	Game.player = self
	defaultScale = scale

func _physics_process(delta): 
	input.x = Input.get_action_strength("move_forward") - Input.get_action_strength("move_back")
	rotationDirection = 0
	if Input.is_action_pressed("turn_right"):
		rotationDirection += 1
	elif Input.is_action_pressed("turn_left"):
		rotationDirection += -1

	fireWait = max(fireWait - delta, 0)
	if Input.is_action_pressed("fire") && fireWait == 0:
		fire()
		fireWait = fireTimeout
	
	velocity += Vector3(input.x * acceleration * delta, 0, 0).rotated(Vector3.DOWN, rotation.y * -1)
	velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)
	velocity.z = clamp(velocity.z, -maxSpeed, maxSpeed)
	
	fireParticles.emitting = input.x > 0
	
	if input.x == 0 && velocity != Vector3.ZERO:
		velocity = lerp(velocity, Vector3.ZERO, frictionWeight)
	
	rotation.y += rotationDirection * rotationSpeed * delta * -1
	velocity = move_and_slide(velocity)
	
func fire():
	var bullet = bulletScene.instance()
	var gun = gun1 if bulletCount % 2 == 0 else gun2
	var bulletPosition : Vector3 = gun.global_transform.origin #.rotated(Vector3.DOWN, rotation.y * -1)
	#translation += Vector3(1, 0, (0.3 if count % 2 == 0 else -0.3)).rotated(Vector3.DOWN, rotation.y * -1)
	
	bullet.init(bulletPosition, rotation.y)
	get_tree().root.add_child(bullet)
	bulletCount += 1
