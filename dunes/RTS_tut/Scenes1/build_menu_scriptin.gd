extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var menu = $%MenuButton
	var pop_up = menu.get_popup()
	pop_up.id_pressed.connect(_on_pressed_menu)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	var menu = $MenuButton
	pass
	
func _on_pressed_menu(item_chosen:int) -> void:
	print(item_chosen)
	if item_chosen == 0: 
		print("time to place ant hill mf neow")
	elif item_chosen ==1:
		print("time to place coati tent boooom")
	pass
	
func _on_hovered_menu(item_chosen:int) -> void:
	if item_chosen == 0:
		print("Ant hill description")
	
