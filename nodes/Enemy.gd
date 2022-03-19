extends KinematicBody

export (float) var targetingTime := 2.0
export (float) var blindChargeTime := 1.0
export (float) var turnSpeed := 1.5
export (float) var speed := 4.0
var currentTargetingPhaseTime := 0.0
var targeting := true

onready var target = get_parent().get_node("Player")
var velocity = Vector3.ZERO
#func _physics_process(delta):
#	look_at(target.translation, Vector3.UP)
	
func _process(delta):
	if targetingTime == 0 or blindChargeTime == 0:
		turn(target, delta)
	else:
		currentTargetingPhaseTime += delta
		
		if targeting:
			turn(target, delta)
		
		if targeting and currentTargetingPhaseTime > targetingTime:
			currentTargetingPhaseTime = 0
			targeting = false
		elif !targeting and currentTargetingPhaseTime > blindChargeTime:
			currentTargetingPhaseTime = 0
			targeting = true
		
		
	#velocity += Vector3(100 * delta, 0, 0).rotated(Vector3.DOWN, rotation.y * -1)
	#velocity = move_and_slide(velocity)
	#translation = translation.move_toward(target.translation, delta * 4)
	translation = translation + Vector3(0, 0, -1 * speed * delta).rotated(Vector3.DOWN, rotation.y * -1)

func turn(player, delta):
	var global_pos = global_transform.origin
	var player_pos = player.global_transform.origin
	var rotation_speed = turnSpeed * delta
	var wtransform = global_transform.looking_at(Vector3(player_pos.x,global_pos.y,player_pos.z),Vector3(0,1,0))
	var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), rotation_speed)

	global_transform = Transform(Basis(wrotation), global_transform.origin)
