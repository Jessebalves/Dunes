extends Button

var saveData:PlayerSave = PlayerSave.new()
var savePath:= "user://saves/slot_1.tres"
var savePath1:= "user://saves/slot_2.tres"
var savePath2:= "user://saves/slot_3.tres"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://saves/"))
	var name_found = $LineEdit.text
	var slot_chosen = $LineEdit2.text
	saveData.name = name_found
	saveData.save_slot_chosen = slot_chosen
	if slot_chosen == "1":
		ResourceSaver.save(saveData,savePath)
	elif slot_chosen == "2":
		ResourceSaver.save(saveData,savePath1)
	elif slot_chosen == "3":
		ResourceSaver.save(saveData,savePath2)
	else:
		print("Save slot does not exist")
	
	get_tree().reload_current_scene()
