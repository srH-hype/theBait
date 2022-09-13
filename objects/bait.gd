extends KinematicBody2D

const speed = 280
var velocity = Vector2(0,0)
signal gameOver

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$Sprite.rotation_degrees = 10
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$Sprite.rotation_degrees = -10
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x,0,0.1)
	
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		$Sprite.rotation_degrees = 0
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		print("I collided with ", collision.collider.name)
		if collision.collider.name !="wallL" && collision.collider.name !="wallR":
			emit_signal("gameOver")

