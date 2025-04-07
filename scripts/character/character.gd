class_name Character extends CharacterBody2D

@export var bodies: Array[Texture2D]
@export var hands: Array[Texture2D]

@export var acceleration: float = 10000.0
@export var deceleration: float = 10000.0
@export var max_speed: float = 1000.0
@export var min_speed: float = 10.0

@export var h_axis: float = 0.0
@export var v_axis: float = 0.0
@export var aim_direction: Vector2 = Vector2.UP
@export var l_hand_attacking: bool = false
@export var r_hand_attacking: bool = false

@export var terrain_tiles: TileMapLayer

@onready var body_sprite: Sprite2D = $BodyShape/BodySprite
@onready var left_hand_sprite: Sprite2D = $LeftHand/LeftHandShape/LeftHandSprite
@onready var right_hand_sprite: Sprite2D = $RightHand/RightHandShape/RightHandSprite
@onready var hands_animation_tree: AnimationTree = $Animations/HandsAnimationTree


func _ready():
	_randomize_body()
	_randomize_hands()


func _physics_process(delta: float) -> void:
	_aim()
	_move(delta)

 
func _aim() -> void:
	rotation = aim_direction.angle() + deg_to_rad(90.0)


func _move(delta: float) -> void:
	if h_axis != 0:
		velocity.x += h_axis * acceleration * delta
	else:
		var h_decel = deceleration * delta
		if abs(velocity.x) < h_decel:
			velocity.x = 0.0
		else:
			if velocity.x > 0:
				velocity.x -= h_decel
			else:
				velocity.x += h_decel
	
	if v_axis != 0:
		velocity.y += v_axis * acceleration * delta
	else:
		var v_decel = deceleration * delta
		if abs(velocity.y) < v_decel:
			velocity.y = 0.0
		else:
			if velocity.y > 0:
				velocity.y -= v_decel
			else:
				velocity.y += v_decel
	velocity = velocity.limit_length(max_speed)

	hands_animation_tree["parameters/hands_move/time_scale/scale"] = get_real_velocity().length() / max_speed

	move_and_slide()


func _randomize_body():
	if bodies.size() <= 0:
		return
	
	var index = randi() % bodies.size()
	var body_texture = bodies[index]
	body_sprite.texture = body_texture


func _randomize_hands():
	if hands.size() <= 0:
		return

	var index = randi() % hands.size()
	var hand_texture = hands[index]
	left_hand_sprite.texture = hand_texture
	right_hand_sprite.texture = hand_texture
