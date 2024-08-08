class_name MainScene
extends Control

@onready var counter: Label = $Counter
@onready var expire_timer: Timer = $ExpireTimer
@onready var game_enter: Label = $GameEnter
@onready var button: Button = $Button

var numberCounter: int

func _on_button_pressed() -> void:
	numberCounter += 1
	counter.text = ("Pressed %s times" %numberCounter)
	game_enter.text = ("This is game %s" %CounterManager.counter)
	if numberCounter  >= 10:
		expire_timer.start()
		button.disabled = true

func _on_expire_timer_timeout() -> void:
	CounterManager.increment_counter()
	get_tree().quit()

