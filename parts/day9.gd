extends Control

var bite_count: int = 0
const MAX_BITES: int = 22

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
		# You are now eating the last burger. It’s much larger.
		"Daq: You, player. I know if you’re STILL wanting to read through all of this, then you’re expecting me to do something about this. I won’t. I’m not doing much.",
		"Daq: See, when my other pal changed the area from your game: Replacing food, literally taking you to the mountain, you still played the game. You acted as if everything was normal.",
		"Daq: As much as it’d sound like an exaggeration, I’d not have taken it like that. I’d probably be in the worst pain possible, and not even want to eat, lest I end up vomiting, having nausea, or just spitting it all out entirely.",
		"Daq: It’s difficult for myself to adapt to any kind of change in my life. I’ve been too used to just sitting at my home just making these games, and having the creator craft up these length journal entries.",
		"Daq: He needs to let the world know though. Nobody else is just going to understand this situation. Nobody is going to know how this feels for me. And nobody is probably going to end up playing this game.",
		"Daq: Even making this game presents many difficulties. Are people going to play? Do they want a good story out of this? Are they looking for something more serious? What in the world do they want?",
		"Daq: I don’t know if I’m useful anymore. Look, I know I’m still young within my timeframe, but the fears of having to survive in the wild and having to worry about everything else is going to bombard my life.",
		"Daq: Taking into consideration that this is the only time I really have to utilize my experience and keep working on games in general entirely. After this, there’s so much to worry about.",
		"Daq: This game, heck, probably only took so long, just because I had nearly no time to even post this game up. Everything occupies my mind, and forces me to not be able to make this game at all.",
		"Daq: There’s no time for me to waste. I feel as if I have nothing in my life that I can end up doing. Have I put more effort into trying to numb the pain? I have, and will try, I can tell you that much.",
		"Daq: Knowing that this entire year was already crappy on its own, Knowing that I can’t wait to tell you how much of a crappier situation I’m going to be under, and knowing that I’m basically weaker than all of you-",
		"Daq: What a day, huh? Don’t you really just like listening? Doesn’t this just make you worried for me at all? Yet I feel as if I should just take this all for myself rather than tell you all?",
		"Daq: But, I digress. You’re still playing because you’d either want to really care for me, you’re lazy and just thought this game looked interesting, or you’re just wanting to speedrun through and see if there’s anything fun in here.",
		"...",
		"...",
		"...",
		"Daq: Look, I don’t even know what I can do anymore for you. This is just going to be a complicated situation, and I have nothing in mind anymore.",
		"Daq: Just trapped in this world, without anything to hear. There’s nothing for me to do. And I can do is keep making games, and end up, doing-",
		"???: Hey, shut up over there.",
		"...",
		"That was a good burger.",
		"But I should leave, NOW..."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
