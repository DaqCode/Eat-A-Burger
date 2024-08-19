extends Sprite2D

func _on_mango_area_mouse_entered() -> void:
	# mango.scale = Vector2(0.09, 0.106)
	# if Input.is_action_just_pressed("leftMouse"):
	# 	var timer = get_tree().create_timer(2.0)
	# 	timer.connect("timeout", Callable(self, "_on_mango_timer_timeout"))
	# 	timer.start()

func _on_mango_timer_timeout() -> void:
	print("mango")
	get_tree().quit()

func _on_mango_area_mouse_exited() -> void:
	mango.scale = Vector2(0.08, 0.094)