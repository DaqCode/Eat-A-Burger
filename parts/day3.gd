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
	var dialogues = [
		"Daq: Well. Now you can’t have what you want. I’m forcing you to adapt to another change, that isn’t your \"so-called\" burger.",
		"Daq: ...That didn’t stop you at all. Unless you’re really hungry or something. Or you’re just wanting to piss me off.",
		"Daq: Well, aren't I damned. You better stop soon.",
		"...",
		"Daq: Alright fine. if this wasn’t frustrating you enough, I might have an idea what will. Sooner or later. I’ll make you so bored, you’ll stop playing this game.",
		"...",
		"...",
		"...",
		"...",
		"That was a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
