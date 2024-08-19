class_name MainMenu
extends Control

@onready var lights_flicker: AnimationPlayer = $LightsFlicker
@onready var intro_animation: AnimationPlayer = $IntroAnimation

@onready var play: Button = $ButtonContainer/Play
@onready var exit: Button = $ButtonContainer/Exit
@onready var extra_journals: Button = %ExtraJournals

func _on_ready() -> void:
	intro_animation.play("mainMenuAnimation")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://parts/day1.tscn")


func _on_exit_pressed() -> void:
	print("Quited the game")
	get_tree().quit()


func _on_extra_journals_pressed() -> void:
	pass


func _on_intro_animation_animation_finished(anim_name: StringName) -> void:
	print("animation done")
	lights_flicker.play("LightFlicker")
	print("New animations playing")

