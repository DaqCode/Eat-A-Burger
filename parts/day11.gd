extends Control

var bite_count: int = 0
const MAX_BITES: int = 10

func _ready() -> void:
	update_dialogue()
	$"Which game number".text = ("Game number: %s" % CounterManager.counter)

func _on_button_pressed() -> void:
	bite_count += 1
	if bite_count >= MAX_BITES:
		CounterManager.increment_counter()
		var next_scene = CounterManager.get_scene_for_current_day()
		get_tree().change_scene_to_packed(next_scene)
	else:
		update_dialogue()

func update_dialogue() -> void:
	#This might as well feel like day one. It's the last burger. Savor it I suppose.
	var dialogues = [
		"...",
		"Daq:  I’ve told you most of what I could.",
		"...",
		"Daq: We’re at the end. You didn’t need to keep eating.",
		"...",
		"Daq: Just how committed did you have to be to even bother reading all of this.",
		"...",
		"Daq: Don’t worry about everything else, the debt’s have been paid off anyways.",
		"...",
		"Daq: You can leave now. My book has come to the last chapter.",
		"...",
		"That was a DAMN good burger.",
		"...",
		"And a good conversation."
		#Game end, cut to credit I suppose.
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
