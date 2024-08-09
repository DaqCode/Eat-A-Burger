extends Control

var bite_count: int = 0
const MAX_BITES: int = 11

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
		"Daq: So persistent. Who even are you?",
		"Daq: Why are you even playing? Is there any reason for you to be doing ANY of this?",
		"Daq: I’ll just drop it. I’m really only 16. Maybe 17. I don’t even know. It plaques my mind to think about it.",
		"Daq: Even then, so many of you think that I’m just still young, and well, you’re not too wrong. But there’s just more that occupies my mind.",
		"Daq: …Severe anxiety. It honestly corrupts my entire body with all these worries. I hate even referencing it myself; it brings me to tears.",
		"Daq: Aren’t you having so much fun watching a man feel corrupt and cry at his own self? He’s got to grow up and be better.",
		"Daq: If it’s not too obvious, I have just way too many things that are wrong with me. It’s not just anxiety; there’s much else that builds up in my mind. Makes me way too tired to face it all.",
		"Daq: There can be so much else to talk about within this short amount of time we have. But you know.",
		"Daq: It’s a shame time cannot be stopped.",
		"...",
		"That wwas a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
