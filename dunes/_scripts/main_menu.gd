extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mute_button = preload("res://_assets/Mute.png")
	var unmute_button = preload("res://_assets/Unmute.png")
	var bus_idx = AudioServer.get_bus_index("Master")
	if AudioServer.is_bus_mute(bus_idx) == true:
		%muteButton.icon = mute_button
	elif AudioServer.is_bus_mute(bus_idx) == false:
		%muteButton.icon = unmute_button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_quit_button_1_pressed() -> void:
	get_tree().quit()


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/saveFileScreen.tscn")


func _on_mute_button_pressed() -> void:
	var mute_button = preload("res://_assets/Mute.png")
	var unmute_button = preload("res://_assets/Unmute.png")
	var bus_idx = AudioServer.get_bus_index("Master")
	if AudioServer.is_bus_mute(bus_idx) == true:
		AudioServer.set_bus_mute(bus_idx, false)
		print("music is unmuted")
		%muteButton.icon = unmute_button
	elif AudioServer.is_bus_mute(bus_idx) == false:
		AudioServer.set_bus_mute(bus_idx, true)
		print("music is muted")
		%muteButton.icon = mute_button

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/settings.tscn")


func _on_pressed() -> void:
	pass # Replace with function body.
