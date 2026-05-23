extends Node
class_name SaveManager
#constant path where save file will be stored
#constant path where save file will be stored
const SAVE_PATH0:= "user://saves/slot_1.tres"
const SAVE_PATH1:= "user://saves/slot_2.tres"
const SAVE_PATH2:= "user://saves/slot_3.tres"
const TEMP_SAVE := "user://saves/temp_save.tres"

var saveData:PlayerSave = PlayerSave.new()

	
func create_save():
	$Window.visible = true
	

func delete_file():
	$Window2.show()
	
func loading_save_one():
	if FileAccess.file_exists(SAVE_PATH0):
		var save_chosen = load(SAVE_PATH0)
		#print(save_chosen.name)
		ResourceSaver.save(save_chosen,TEMP_SAVE)
		
		get_tree().change_scene_to_file("res://RTS_tut/Scenes1/World_Main.tscn")
		MusicManager.main_menu.stop()
		MusicManager.tutorialo.play()

	else:
		#checks, if there's none, create this directory, easier for save managment
		DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://saves/"))
		#Makes the PlayerSave file
		
func loading_save_two():
	if FileAccess.file_exists(SAVE_PATH1):
		var save_chosen = load(SAVE_PATH1)
		print("loading save data for file 2")
		#ResourceLoader.load(SAVE_PATH1)
		ResourceSaver.save(save_chosen,TEMP_SAVE)
	
		get_tree().change_scene_to_file("res://RTS_tut/Scenes1/World_Main.tscn")
		MusicManager.main_menu.stop()
		MusicManager.tutorialo.play()
		
	else:
		#checks, if there's none, create this directory, easier for save managment
		#DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://saves/"))
		#Makes the PlayerSave file
		#ResourceSaver.save(saveData, SAVE_PATH1)
		#print("Save file created in slot 2...")
		#loading_save_two()
		pass
		
func loading_save_three():
	if FileAccess.file_exists(SAVE_PATH2):
		print("loading save data for file 3")
		var save_chosen = load(SAVE_PATH2)
		#ResourceLoader.load(SAVE_PATH1)
		ResourceSaver.save(save_chosen,TEMP_SAVE)
	
		get_tree().change_scene_to_file("res://RTS_tut/Scenes1/World_Main.tscn")
		MusicManager.main_menu.stop()
		MusicManager.tutorialo.play()
		#ResourceLoader.load(SAVE_PATH2)
		
	else:
		#checks, if there's none, create this directory, easier for save managment
		#DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://saves/"))
		#Makes the PlayerSave file
		pass
