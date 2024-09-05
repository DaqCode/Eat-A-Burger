extends Sprite2D

func _on_mango_area_mouse_entered() -> void:
	# mango.scale = Vector2(1.2, 1.2)
	# if Input.is_action_just_pressed("leftMouse"):
	# 	var timer = get_tree().create_timer(2.0)
	# 	timer.connect("timeout", Callable(self, "_on_mango_timer_timeout"))
	# 	timer.start()

func _on_mango_timer_timeout() -> void:
	print("mango")
	get_tree().quit()

	#mango.scale = Vector2(1, 1)

func _on_mango_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.
