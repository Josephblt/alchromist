class_name Player extends Character


@onready var camera: Camera2D = $Camera


func _ready() -> void:
	super._ready()
	_adjust_camera_limits()


func _physics_process(delta: float) -> void:
	_handle_aim_h_input()
	_handle_aim_v_input()
	_handle_move_h_input()
	_handle_move_v_input()
	_handle_l_hand_input()
	_handle_r_hand_input()
	super._physics_process(delta)


func _adjust_camera_limits() -> void:
	var min_pos: Vector2i = Vector2i.MAX
	var max_pos: Vector2i = Vector2i.MIN

	var rect: Rect2i = terrain_tiles.get_used_rect()
	var size: Vector2i = terrain_tiles.tile_set.tile_size
	
	var pos: Vector2i = rect.position * size
	var end: Vector2i = rect.end * size

	min_pos = Vector2i(min(min_pos.x, pos.x), min(min_pos.y, pos.y))
	max_pos = Vector2i(max(max_pos.x, end.x), max(max_pos.y, end.y))

	var level_size: Vector2i = rect.size * size
	print(level_size)
	var viewport_size: Vector2 = camera.get_viewport_rect().size
	print(viewport_size)

	if viewport_size.x < level_size.x:
		camera.limit_left = min_pos.x
		camera.limit_right = max_pos.x
	
	if viewport_size.y < level_size.y:
		camera.limit_top = min_pos.y
		camera.limit_bottom = max_pos.y


func _handle_aim_h_input() -> void:
	aim_direction = get_global_mouse_position() - get_global_position()


func _handle_aim_v_input() -> void:
	pass


func _handle_move_h_input() -> void:
	if Input.is_action_pressed("Move Left") and h_axis == 0:
		h_axis = -1
	if Input.is_action_pressed("Move Right") and h_axis == 0:
		h_axis = 1
	
	if !Input.is_action_pressed("Move Left") and h_axis == -1:
		h_axis = 0
	if !Input.is_action_pressed("Move Right") and h_axis == 1:
		h_axis = 0


func _handle_move_v_input() -> void:
	if Input.is_action_pressed("Move Up") and v_axis == 0:
		v_axis = -1
	if Input.is_action_pressed("Move Down") and v_axis == 0:
		v_axis = 1
	
	if !Input.is_action_pressed("Move Up") and v_axis == -1:
		v_axis = 0
	if !Input.is_action_pressed("Move Down") and v_axis == 1:
		v_axis = 0


func _handle_l_hand_input() -> void:
	l_hand_attacking = Input.is_action_pressed("Left Action")


func _handle_r_hand_input() -> void:
	r_hand_attacking = Input.is_action_pressed("Right Action")
