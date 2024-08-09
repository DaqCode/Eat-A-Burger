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
		"Daq: Yeah, there’s no beef in there. You’re eating a vegan burger. Grow up, and leave. Go eat an actual burger, and don’t come back.",
		"Daq:  God, damn it. I don’t even really know why I’m here talking to you about this. If this isn’t making it more annoying, well, I don’t even know what to do for you.",
		"Daq: You know what. If you’ve decided to stay for this long, I guess there's no reason to not just decide to tell you about everything.",
		"Daq: You see, I am really, just not perfect. Nobody is. I cannot deny that at all.",
		"Daq: The problem with myself is that I have no reputation. I feel worthless. I feel like nothing sometimes..",
		"Daq: If you’ve gone this far, and somehow decide to tell yourself, \"Man, isn't this game interesting?\", I’d have to argue otherwise.",
		"Daq: The thing is, I didn’t think you’d go this far, and considering that I never thought I’d keep talking about this, this is going to be a long conversation.",
		"...",
		"You have a choice. Choose well.",
		"...",
		"That was a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
