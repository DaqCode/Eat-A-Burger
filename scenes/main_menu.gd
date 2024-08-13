extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var play: Button = $VBoxContainer/Play
@onready var extra_journals: Button = $VBoxContainer/ExtraJournals
@onready var exit: Button = $VBoxContainer/Exit



func _ready() -> void:
	animation_player.play("mainMenuAnimation")
	

	


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://parts/day1.tscn")


func _on_exit_pressed() -> void:
	print("Quited the game")
	get_tree().quit()


func _on_extra_journals_pressed() -> void:
	pass
