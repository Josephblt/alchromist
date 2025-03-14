class_name Player extends Character


func _physics_process(delta: float) -> void:
	_handle_aim_h_input()
	_handle_aim_v_input()
	_handle_move_h_input()
	_handle_move_v_input()
	_handle_l_hand_input()
	_handle_r_hand_input()
	super._physics_process(delta)


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
	l_hand_attacking = Input.is_action_pressed("Left Hand")


func _handle_r_hand_input() -> void:
	r_hand_attacking = Input.is_action_pressed("Right Hand")
