extends Control

var time = 0
const FISHSMALL = preload("res://objects/fishSmall.tscn")
const FISHBIG = preload("res://objects/fishBig.tscn")
const MORENA = preload("res://objects/morena.tscn")


func _ready():
	$bait.connect("gameOver", self, "gameOver")

func _on_endPoint_body_entered(body):
	if body.collision_layer == 4:
		body.position = $wavePoint3.global_position
	if body.collision_layer == 2:
		body.queue_free()

func _on_Timer_timeout():
	time += 1
	$Label.text = str(time)
	if time == 21:
		$timerFish.set_wait_time(2)
	if time == 49:
		$timerFish.set_wait_time(1)
	if time == 77:
		$timerFish.set_wait_time(0.7)

func _on_timerFish_timeout():
	randomize()
	var point = randi() % 2
	if point == 0: 
		randomFish1()
	if point == 1:
		randomFish2()

func randomFish1():
	randomize()
	var fish = randi() % 3
	
	if fish == 0:
		var fishSmall = FISHSMALL.instance()
		get_parent().add_child(fishSmall)
		fishSmall.position = $fishPoint1.global_position
	if fish == 1:
		var fishBig = FISHBIG.instance()
		get_parent().add_child(fishBig)
		fishBig.position = $fishPoint1.global_position
	if fish == 2:
		var morena = MORENA.instance()
		get_parent().add_child(morena)
		morena.position = $fishPoint1.global_position

func randomFish2():
	randomize()
	var fish = randi() % 3
	
	if fish == 0:
		var fishSmall = FISHSMALL.instance()
		fishSmall.flip()
		get_parent().add_child(fishSmall)
		fishSmall.position = $fishPoint2.global_position
	if fish == 1:
		var fishBig = FISHBIG.instance()
		fishBig.flip()
		get_parent().add_child(fishBig)
		fishBig.position = $fishPoint2.global_position
	if fish == 2:
		var morena = MORENA.instance()
		morena.flip()
		get_parent().add_child(morena)
		morena.position = $fishPoint2.global_position

func gameOver():
	print("Gameover")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
