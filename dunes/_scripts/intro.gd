extends Control

func _ready() -> void:
	MusicManager.main_menu.stop()
	pass
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://_scenes/main_menu.tscn")
	MusicManager.play_music()
