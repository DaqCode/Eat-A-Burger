extends Control

var bite_count: int = 0
const MAX_BITES: int = 16

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
	#No burger this time, he’s given you an entire dinner. This is going to take a while to finish…
	var dialogues = [
		"Daq: If you’d really want to listen, I suppose I can hand this to you. We’ll be here for quite the while.",
		"Daq: So, uh yeah. My pain, quite literally, controls the trajectory of my life. It’s dumb, but I’m just incredibly weak in turn.",
		"Daq: Every time I have any bites of a stressful situation, my mind just decides to target my stomach. Why? Because it’s the weakest out of my entire body, that's why.",
		"Daq: I don’t vaguely remember the term for it, probably visceral hypersensitivity? It’s rather a serious illness that I have to face.",
		"Daq: If you have no idea what that is, it’s basically just my organs can’t operate normally without having to make my entire body feel worse as well.",
		"Daq: There’s an increase in heartbeat, breathing is much more difficult, I feel like spitting blood every time, maybe this situation is more serious than it is?",
		"Daq: So why don’t I do anything about it? I’m trying, I tell you. Nothing just seems to work, or I just keep overthinking the hell out of it?",
		"Daq: This also applies to myself just having to overthink, nearly all of the time. I can’t get myself to not overthink, if you get what I mean.",
		"Daq: As a child, I prioritized learning this now, instead of later. I’d figured out that the world is generally a scary place.",
		"Daq: That's probably what made my entire body go into survival mode. Without any way of making me able to reach any further. Rather, just staying inside and just making games or watching Youtube.",
		"Daq: You ever think to yourself: Why is this creator still alive? Would you really care for his works? What about so many of the others that might as well just have a worse condition than myself?",
		"Daq: The truth really settles in, that I'm never going to be any more better than anyone else. Comparing myself brings me down to the core. I feel useless.",
		"Daq: You playing this game, you probably just enjoy playing this game for the hell of it. You just likely listen to a man suffer. You’re entertained by a psychopath who doesn’t want to be discussing this matter.",
		"Daq: ...It really doesn’t matter anyways. I know you’ve been reading up towards this entire part. Yet, you’re just going to keep reading, aren’t you?",
		"...",
		"That was a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
