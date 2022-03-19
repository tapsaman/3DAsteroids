extends CSGCylinder

var targetVelocity = Vector2.ZERO
var speed = 0.33

func _physics_process(delta):
	translation.x += targetVelocity.x * speed
	translation.z += targetVelocity.y * speed 

func init(position, rotation, direction):
	translation = position
	rotation.y = rotation.y
	targetVelocity = direction
