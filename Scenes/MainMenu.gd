extends Control

var cont = 0

func _ready():
	$intro1.visible = true
	$intro2.visible = true
	$intro3.visible = true

func _on_introTimer_timeout():
	cont += 1
	if cont == 1:
		$intro1.visible = false
	elif cont == 2:
		$intro2.visible = false
	elif cont == 3:
		$intro3.visible = false
		$introTimer.stop()

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
