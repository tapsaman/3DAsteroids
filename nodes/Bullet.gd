extends KinematicBody

var targetVelocity = Vector2.ZERO
var velocity = Vector2.ZERO
export (int) var speed = 1500

func _physics_process(delta):
	velocity = Vector3(speed * delta, 0, 0).rotated(Vector3.DOWN, rotation.y * -1)
	move_and_slide(velocity)
	pass

func init(pos : Vector3, rotationY):
	translation = pos
	rotation.y = rotationY
	#translation += Vector3(1, 0, (0.3 if count % 2 == 0 else -0.3)).rotated(Vector3.DOWN, rotation.y * -1)

func _on_VisibilityNotifier_screen_exited():
	# print("bullet exit")
	queue_free()
