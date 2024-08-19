extends Control
@onready var game_enter: RichTextLabel = %GameEnter

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
		"Daq: I’ve seen you decided to come back, hm? Must you really want the burger that bad? Or listen to me blabber about everything else regardless of your boredom.",
		"Daq: Have I turned into your Youtube video? Do you just want to listen to what I REALLY have to tell you at all?",
		"Daq: Alright fine. Well, if you couldn’t tell already, I’m Daq. I made this tiny game. All you have to do is eat a burger.",
		"Daq: Seems like you’re going through it quite quickly. Aren’t I glad that I made you stop by disabling that button that you can press to eat everything, huh?",
		"Daq: Well, considering that this is all you’re going to have, you can probably stop playing, or eating if anything.",
		"...",
		"...",
		"...",
		"Well, let’s see what you’ll be doing after this.",
		"...",
		"That was a good burger."
	]
	game_enter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
