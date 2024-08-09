extends Node

var counter: int = 1
const MAX_COUNT: int = 10

const DAY_1 := preload("res://parts/day1.tscn")
const DAY_2 := preload("res://parts/day2.tscn")
const DAY_3 = preload("res://parts/day3.tscn")
const DAY_4 = preload("res://parts/day4.tscn")
const DAY_5 = preload("res://parts/day5.tscn")

func _ready() -> void:	
	# Load the saved counter value
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
	elif get_current_day() == 3:
		return DAY_3
	elif get_current_day() == 4:
		return DAY_4
	elif get_current_day() == 5:
		return DAY_5
	
	#ADD SOME MORE
	else:
		return DAY_1

