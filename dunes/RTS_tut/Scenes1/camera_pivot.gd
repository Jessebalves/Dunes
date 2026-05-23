extends Node3D

@export var cameraSens = 0.004
@export var cameraSpeed = 1.0
@export var maxZoom = 40
@export var minZoom = 0
@export var rotate_time := 0.15
var is_rotating := false
var rotation_step := 0  # 0,1,2,3 (represents 0°,90°,180°,270°)
var tempo = load("user://saves/temp_save.tres")
var direction = Vector2.ZERO
var total_time_played_in_seconds = 0.0

@onready var camera_3d: Camera3D = $Camera3D

func _ready() -> void:
	#Load any variables you need from the temp save here
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	print(tempo.name)
	print("Save slot: ", tempo.save_slot_chosen)
	$%cameraPivot.rotation.y = tempo.camera_position_y
	pass

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"): get_tree().quit()
	

	
	_camera_zoom()
		
func _camera_zoom():
	var zoomChange = 0
	if Input.is_action_pressed("mouse_wheel_up"):
		zoomChange -= 1
	elif Input.is_action_pressed("mouse_wheel_down"):
		zoomChange += 1
		
	camera_3d.size += zoomChange
	camera_3d.size = clamp(camera_3d.size, minZoom, maxZoom)
		
func _physics_process(delta: float) -> void:
	_camera_movement()
	
func _process(delta):
	#added line 46
	total_time_played_in_seconds += delta
	if Input.is_action_just_pressed("rotate_left"):
		_rotate_camera(1)
		#print(direction.x)
		#print(direction.y)

	if Input.is_action_just_pressed("rotate_right"):
		_rotate_camera(-1)
	
	if Input.is_action_just_pressed("open_menu"):
		print("yea!")
		
	if Input.is_action_just_pressed("quit_game"):
		print("Quitting game...")
		tempo.camera_position_y = $%cameraPivot.rotation.y
		#added line 64
		tempo.time_played_seconds += total_time_played_in_seconds
		
		if FileAccess.file_exists("user://saves/temp_save.tres"):
				if tempo.save_slot_chosen == 1:
					ResourceSaver.save(tempo,"user://saves/slot_1.tres")
					print("Saved to slot 1")
					print("Player name: ", tempo.name)
				elif tempo.save_slot_chosen == 2:
					ResourceSaver.save(tempo,"user://saves/slot_2.tres")
					print("Saved to slot 2")
					print("Player name: ", tempo.name)
				else:
					ResourceSaver.save(tempo,"user://saves/slot_3.tres")
					print("Saved to slot 3")
					print("Player name: ", tempo.name)
		get_tree().change_scene_to_file("res://_scenes/main_menu.tscn")
		MusicManager.tutorialo.stop()
		MusicManager.main_menu.play()
	
func _camera_movement():
	#var direction = Vector2.ZERO
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction.x= Input.get_axis("ui_left", "ui_right")
	
	#I think this might be the line of code I need
	global_position += (global_basis * Vector3(direction.x, 0, direction.y)).normalized() * cameraSpeed
	
func _rotate_camera(direction: int):
	if is_rotating:
		return
	
	is_rotating = true
	
	var start_rot = rotation.y
	var end_rot = start_rot + deg_to_rad(90 * direction)
	
	var tween = get_tree().create_tween()
	tween.tween_property(
		self,
		"rotation:y",
		end_rot,
		rotate_time
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	tween.finished.connect(func():
		rotation.y = snapped(rotation.y, deg_to_rad(90))
		is_rotating = false
	)
	
	
