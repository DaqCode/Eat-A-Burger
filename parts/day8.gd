extends Control

var bite_count: int = 0
const MAX_BITES: int = 12

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
		#You now have a plate of a cup of coffee.
		"Daq: Not even going to ask for your reactions. 2 things were forced to change, and can you handle it??",
		"Daq: See, I’ve lived in a family where they wished that I was the highest achieving student. They wanted me to be the doctor that everyone sees.",
		"Daq: Yet, that’s no longer the case. The stomach rather just kills the fun out of me. I cannot travel nearly anywhere in my life, and when I am required to leave, no surprise that I’m just in even more pain.",
		"Daq: Living under these strict conditions just seemed to change my life message and idea. Instead of living life freely without any consequences, now I’m forced to think out every outcome.",
		"Daq: Anything I do forces me to think about every situation. I have to over-exaggerate it, just to think to myself: \"Am I going to live? Or die as a coward\"?",
		"Daq: I never have peace in my home either; the pain still exists, I still live with an overly complicated mind, and I don’t really know if I’m doing anything right in my life.",
		"Daq: Why am I not better than the best coder in my school? Why am I not better than this, why am I not better than that, so on and so forth.",
		"Daq: This is what I mean. Of course, I try to stop comparing myself, yet of course, it comes towards me especially when I have some kind of weak skill under my belt.",
		"Daq: Every day I think to myself, I nearly end up getting backstabbed by some of the secret assassins in my head that keep prioritizing worrying, and try to take control of me.",
		"Daq: And well, maybe if you’d figured it out by now, then, you’d probably understand. But I know not a single person will understand. Because they haven't gone through what I’ve gone through.",
		"...",
		"That was a good burger."
	]
	$GameEnter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
