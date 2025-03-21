class_name Player extends Character


@export var level_layers: Array[TileMapLayer]

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
	if level_layers.size() == 0:
		return

	var min_pos: Vector2i = Vector2i.MAX
	var max_pos: Vector2i = Vector2i.MIN

	for layer in level_layers:
		var rect: Rect2i = layer.get_used_rect()
		var size = layer.tile_set.tile_size
		
		min_pos = Vector2i(min(min_pos.x, rect.position.x), min(min_pos.y, rect.position.y)) * size
		max_pos = Vector2i(max(max_pos.x, rect.end.x), max(max_pos.y, rect.end.y)) * size
	
	camera.limit_left = min_pos.x
	camera.limit_top = min_pos.y
	camera.limit_right = max_pos.x
	camera.limit_bottom = max_pos.y


func _handle_aim_h_input() -> void:
	aim_direction = get_global_mouse_position() - get_global_position()


func _handle_aim_v_input() -> void:
	aim_direction = get_global_mouse_position() - get_global_position()


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
