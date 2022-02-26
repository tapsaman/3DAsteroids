extends Spatial

var targetVelocity = Vector2.ZERO
var isFiring = false
var fireTimeout = 1
var fireCurrentTimeout = 0

func _physics_process(delta):
	translation += targetVelocity
	
	fireCurrentTimeout = max(fireCurrentTimeout - delta, 0)
	
	if isFiring and fireCurrentTimeout == 0:
		fire()
	
func fire():
	print("FIRE !!!")
