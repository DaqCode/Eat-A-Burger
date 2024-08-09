extends Control

var bite_count: int = 0
const MAX_BITES: int = 30

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
	#Funny time: You have no food anymore, and you’re just going to listen.`
	var dialogues = [
		"But there’s nothing to eat.",
		"???: Never seen you around. Considering I’m quite shy, I’ll remain unknown for your cause. Your “so-called-friend” is knocked out. He’ll not be waking up for a while.",
		"???: Well, I’m just an acquaintance of his. I’ve been there for him for quite some time, and he’s just been complaining over and over again about his life.",
		"???: I can’t tell you how many times I feel as if I have to tell him to shut his foul-spitting mouth, considering what he tells everyone else. And look, as much as I can’t do much for him myself, I still care for him.",
		"???: Why does this matter? I'm his supposed significant other. I’ve supported him for a while, as he’s done to me, and yet, I feel as I keep putting myself as a burden across from him.",
		"???: In all honesty, I really don’t care if he has all these illnesses. Whether it be anxiety, stomach problems, overthinking the future, comparing, etc., I don’t really care about it.",
		"???: I want him to start thinking about the now. I don’t care much for the future that he thinks of. I care for them now. And I want him to start feeling like that as well.",
		"Daq: Ah, god. Where the hell am I? I’m feeling even more pain than usual- Who the hell are you?",
		"Daq: Wait, you’re the guy from the- Huh? What are you doing here at all?",
		"???:  You really are just blind aren’t you. Just get back to sleep, I’ll keep your so-called, “human” occupied with your problems.",
		"Daq: Could you not. I’m trying to just have a talk with him. I’d not need you to have to butt into this situation. If you’re deciding to share what we both kept in private, then there’s no other reason that I should have told you anything, should I?",
		"??? gets up and storms out the room.",
		"Daq: I’m sorry, it’s just that- nevermind. Back to the topic.",
		"Daq: Look, it’s  more crazy to think that I already have worries about her. I know I was already being rude to her. I know I was.",
		"Daq: But, really, look. What I want to tell you is that there's not much I can do.",
		"Daq: If you really think about this entire situation in full, there are such little things that can occur. Yet there’s everything, and everything is also little, unless you overthink it.",
		"Daq: I’m not a person who’d want to believe in the fact that there’s a so-called, “afterlife”, but knowing the chances I have, it’s going to be rather peculiar.",
		"Daq: Let me be clear. You just played through all of this, just listening to myself talk to you, about my life, and nearly everything else.",
		"Daq: Who knows if I have more to tell? Who else is going to know if I’m going to make even more updates towards this? Who knows if I’ll even be alive till then?",
		"Daq: Aren’t you really a strange one? You’d keep yourself entertained by someone who just wishes to complain about his problems in a game instead of a book or a Youtube video.",
		"Daq: I’ve already complained for a long enough time. You probably are going to start running low on time, and I will as well. Time is always ticking. Every minute that passes, every second, every millisecond, is all wasted opportunity if you end up scrolling through Youtube.",
		"Daq: And oh man, do I ever hate doing that.",
		"Daq: In reality, I’m more or less terrified to tell anyone about my situation. Telling you, reader, this entire story, within my own hands, was quite the painful journey.",
		"Daq: Yet, you still persisted. I don’t get why so many of you love to keep pushing forward, and why you’d want to keep playing this 30 or so minute adventure.",
		"Daq: Is it really just human suffrage that you really like to hear about? You’d want to hear why I am in so much pain? Do you really grow interested in this at all?",
		"Daq: ...Well, I guess there’s no way to have this done for then, huh? You’re just going to keep listening, over and over and over again.",
		"Daq: And there won’t be a resolution towards this at all. Do you not understand that?",
		"Daq: Well, if you really just want to be like that, you may as well leave. I have nothing else to say to you.",
		"...",
		"That was a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
