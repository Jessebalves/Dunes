extends Control

var counter = 0 
func load_all_save_data(array_of_saves,arrayoo):
	for item in array_of_saves:
		if FileAccess.file_exists(item):
			var file = ResourceLoader.load(item)
			var time = file.time_played_seconds
			var hours = time/3600
			var minutes = int(time) % 3600 / 60
			var seconds = int(time) % 3600 % 60
			var file_name = arrayoo[counter]
			file_name.text = "Name: " + str(file.name)
			counter += 1
			arrayoo[counter].text = "Time Played: " + str(floor(int(hours))) + "h:" + str(minutes) + "m:" + str(seconds) + "s"
			counter += 1
		else:
			arrayoo[counter].text = "Name: No data"
			counter += 1
			arrayoo[counter].text = "Time Played: No data"
			counter += 1
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var array_of_saves = ["user://saves/slot_1.tres","user://saves/slot_2.tres","user://saves/slot_3.tres"]
	var array_of_saves_test = ["user://saves/slot_1.tres"]
	var arrayo = [$%FileOneName,$%TimePlayed,$%FileTwoName,$%TimePlayed2,$%FileThreeName,$%TimePlayed3]
	load_all_save_data(array_of_saves,arrayo)
	
	#REFACTORED THIS CODE ALREADY
	#if FileAccess.file_exists("user://saves/slot_1.tres"):
	#	var file1 = ResourceLoader.load("user://saves/slot_1.tres")
	#	var time = file1.time_played_seconds
	#	var hours = time/3600
	#	var minutes = int(time) % 3600 / 60
	#	var seconds = int(time) % 3600 % 60
	#	$%FileOneName.text = "Name: " + str(file1.name)
	#	$%LvlsComplete.text = ("Levels Complete: " + str(file1.lvls))
	#	$%TimePlayed.text = "Time Played: " + str(floor(int(hours))) + "h:" + str(minutes) + "m:" + str(seconds) + "s"
	#	
	#else:
	#	$%FileOneName.text = "Name: No data"
	#	$%LvlsComplete.text = "Levels Complete: No data"
	#	$%TimePlayed.text = "Time Played: No data"
		
	#if FileAccess.file_exists("user://saves/slot_2.tres"):
	#	var file2 = ResourceLoader.load("user://saves/slot_2.tres")
	#	var time = file2.time_played_seconds
	#	var hours = time/3600
	#	var minutes = int(time) % 3600 / 60
	#	var seconds = int(time) % 3600 % 60
	#	$%FileTwoName.text = ("Name: " + str(file2.name))
		#$%LvlsComplete2.text = ("Levels Complete: " + str(file2.lvls))
	#	$%TimePlayed2.text =  "Time Played: " + str(floor(int(hours))) + "h:" + str(minutes) + "m:" + str(seconds) + "s"
		
	#else:
	#	$%FileTwoName.text = "Name: No Data"
		#$%LvlsComplete2.text = "Levels Completed: No Data"
	#	$%TimePlayed2.text = "Time Played: No data"
		
	#if FileAccess.file_exists("user://saves/slot_3.tres"):
	#	var file3 = ResourceLoader.load("user://saves/slot_3.tres")
	#	var time = file3.time_played_seconds
	#	var hours = time/3600
	#	var minutes = int(time) % 3600 / 60
	#	var seconds = int(time) % 3600 % 60
	#	$%FileThreeName.text = "Name: " + str(file3.name)
		#$%LvlsComplete3.text = "Levels Completed: " + str(file3.lvls)
	#	$%TimePlayed3.text =  "Time Played: " + str(floor(int(hours))) + "h:" + str(minutes) + "m:" + str(seconds) + "s"
		
	#else:
	#	$%FileThreeName.text = "Name: No Data"
	#	$%LvlsComplete3.text = "Levels Completed: No Data"
	#	$%TimePlayed3.text = "Time Played: No Data"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://_scenes/main_menu.tscn")

func _on_window_close_requested() -> void:
	$%Window.hide()

func _on_window_2_close_requested() -> void:
	$%Window2.hide()

func _on_file_2_delete_pressed() -> void:
	DirAccess.remove_absolute("user://saves/slot_2.tres")
	get_tree().reload_current_scene()

func _on_file_3_delete_pressed() -> void:
	DirAccess.remove_absolute("user://saves/slot_3.tres")
	get_tree().reload_current_scene()
