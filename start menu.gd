extends Control


func _on_start_pressed():
	get_tree().change_scene("res://world.tscn")
	pass # replace with function body


func _on_quit_pressed():
	get_tree().quit()
