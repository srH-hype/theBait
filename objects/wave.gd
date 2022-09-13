extends KinematicBody2D

var velocity = Vector2(0,0)

func _physics_process(delta):
	velocity.y = -280
	move_and_slide(velocity)
