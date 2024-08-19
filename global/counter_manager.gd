extends Node

var counter: int = 1
const MAX_COUNT: int = 12

const DAY_1 := preload("res://parts/day1.tscn")
const DAY_2 := preload("res://parts/day2.tscn")
const MAIN_MENU := preload("res://scenes/main_menu.tscn")


func _ready() -> void:
	if FileAccess.file_exists("user://counter.save"):
		var file = FileAccess.open("user://counter.save", FileAccess.READ)
		counter = file.get_32()
		file.close()

func increment_counter() -> void:
	counter += 1
	if counter >= MAX_COUNT:
		counter = 0

	var file = FileAccess.open("user://counter.save", FileAccess.WRITE)
	file.store_32(counter)
	file.close()
	
func reset() -> void:
	counter = 1
	var file = FileAccess.open("user://counter.save", FileAccess.WRITE)
	file.store_32(counter)
	file.close()

func get_current_day() -> int:
	return counter % MAX_COUNT

func get_scene_for_current_day() -> PackedScene:
	if get_current_day() == 1:
		return DAY_1
	elif get_current_day() == 2:
		return DAY_2
	#elif get_current_day() == 3:
		#return DAY_3
	#elif get_current_day() == 4:
		#return DAY_4
	#elif get_current_day() == 5:
		#return DAY_5
	#elif get_current_day() == 6:
		#return DAY_6
	#elif get_current_day() == 7:
		#return DAY_7
	#elif get_current_day() == 8:
		#return DAY_8
	#elif get_current_day() == 9:
		#return DAY_9
	#elif get_current_day() == 10:
		#return DAY_10
	#elif get_current_day() == 11:
		#return DAY_11
	else:
		return MAIN_MENU

