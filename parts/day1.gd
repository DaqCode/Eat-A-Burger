extends Control

@onready var game_enter: RichTextLabel = %GameEnter

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var bite_count: int = 0
const MAX_BITES: int = 10

func _ready() -> void:
	animation_player.play("slowApppear")
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
		"...",
		"...",
		"...",
		"...",
		"...",
		"...",
		"...",
		"...",
		"...",
		"That was a good burger."
	]
	game_enter.text = dialogues[bite_count]

func _on_reset_pressed() -> void:
	CounterManager.reset()
	get_tree().quit()
