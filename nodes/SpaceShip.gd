extends Spatial

var targetDirection = Vector2.ZERO 
var direction = Vector2.ZERO 
var targetVelocity = Vector2.ZERO
var isFiring = false
var fireTimeout = 0.2
var fireCurrentTimeout = 0
var speed = 0.12
var bulletScene = preload("res://nodes/Bullet.tscn")
var canMove = true

func _physics_process(delta):
	translation.x += targetVelocity.x * speed
	translation.z += targetVelocity.y * speed 
	rotation.y = rad2deg(direction.angle()) - 90
	rotation.y = rad2deg(direction.angle()) - 90

	fireCurrentTimeout = max(fireCurrentTimeout - delta, 0)

	if isFiring and fireCurrentTimeout == 0:
		fire()
		fireCurrentTimeout = fireTimeout

func moveToVelocity(v):
	if canMove == false:
		return
	if v.x != 0 or v.y != 0:
		direction =  v
		print(str(direction.angle()) + " : " + str(rad2deg(direction.angle())))
		rotation.y = rad2deg(direction.angle()) - 90
		print(rotation)
	targetVelocity = v
	
func toggleFire(v):
	isFiring = v

func fire():
	print("FIRE !!!")
	var bullet = bulletScene.instance()
	bullet.init(translation, rotation, direction)
	bullet.transform = transform
	bullet.targetVelocity = direction
	#bullet.rotation.y = rad2deg(direction.angle()) - 90
	get_tree().root.add_child(bullet)
