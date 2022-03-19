extends Camera

onready var player = get_parent().get_node("Player")
var targetTranslation = null

const defaultRotation = Vector3(deg2rad(-90), deg2rad(90), deg2rad(-90))

func _ready():
	translation.x = player.translation.x
	translation.z = player.translation.z
	translation.y = player.translation.y + 8
	rotation = defaultRotation

func _physics_process(delta):
	if Game.state == Game.States.RUNNING:
		var velocity = Vector3(player.velocity.x, 0, player.velocity.z)
		var newCamPos = translation + velocity * delta * 1.2
		newCamPos.x = min(max(newCamPos.x, player.translation.x - 5), player.translation.x + 5)
		newCamPos.z = min(max(newCamPos.z, player.translation.z - 2), player.translation.z + 2)
		translation = newCamPos
		
	elif Game.state == Game.States.OPENING_MAP:
		targetTranslation = targetTranslation if targetTranslation else player.translation + Vector3(14, 50, 0)
		translation = translation.move_toward(targetTranslation, delta * 50)
		rotation = rotation.move_toward(Vector3(deg2rad(-70), deg2rad(90), deg2rad(-90)), delta * 0.5)
		if translation == targetTranslation:
			targetTranslation = null
			Game.state = Game.States.OPEN_MAP
	
	elif Game.state == Game.States.EXITING_MAP:
		targetTranslation = targetTranslation if targetTranslation else player.translation + Vector3(0, 8, 0)
		translation = translation.move_toward(targetTranslation, delta * 50)
		rotation = rotation.move_toward(defaultRotation, delta * 0.5)

		if translation == targetTranslation:
			targetTranslation = null
			Game.state = Game.States.RUNNING
			get_tree().paused = false
		



