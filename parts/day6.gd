extends Control

var bite_count: int = 0
const MAX_BITES: int = 7

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
	var dialogues = [
		"Daq: If this hasn't proved you’re just even more consistent and want to keep listen- Alright I’ll be quiet. Go have your fun already",
		"Daq: Already considering the time between the two of us slowly growing short, this is going to be rather difficult to express.",
		"Daq: Saying that I have anxiety 24/7 really isn’t just a joke; I rather live with it every single day. And it completely controls my life.",
		"Daq: Not even a single chance do I get a time to not worry. Overthinking takes my mind away from this entire situation, and ends up forcing me to think even harder.",
		"Daq: And rather, the control is through brute pain.",
		"...",
		"That wwas a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
