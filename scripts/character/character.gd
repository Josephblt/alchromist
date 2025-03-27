class_name Character extends Node


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

@onready var body: CharacterBody2D = $Body
@onready var body_sprite: Sprite2D = $Body/BodyShape/BodySprite
@onready var left_hand_sprite: Sprite2D = $LeftHand/LeftHandShape/LeftHandSprite
@onready var right_hand_sprite: Sprite2D = $RightHand/RightHandShape/RightHandSprite


func _ready():
	# _randomize_body()
	# _randomize_hands()
	pass


func _physics_process(delta: float) -> void:
	_aim()
	_move(delta)

 
func _aim() -> void:
	body.rotation = aim_direction.angle() + deg_to_rad(90.0)


func _move(delta: float) -> void:
	if h_axis != 0:
		body.velocity.x += h_axis * acceleration * delta
	else:
		var h_decel = deceleration * delta
		if abs(body.velocity.x) < h_decel:
			body.velocity.x = 0.0
		else:
			if body.velocity.x > 0:
				body.velocity.x -= h_decel
			else:
				body.velocity.x += h_decel
	
	if v_axis != 0:
		body.velocity.y += v_axis * acceleration * delta
	else:
		var v_decel = deceleration * delta
		if abs(body.velocity.y) < v_decel:
			body.velocity.y = 0.0
		else:
			if body.velocity.y > 0:
				body.velocity.y -= v_decel
			else:
				body.velocity.y += v_decel
	body.velocity = body.velocity.limit_length(max_speed)
	body.move_and_slide()


func _randomize_body():
	if bodies.size() <= 0:
		return
	
	var index = randi() % bodies.size()
	# print_debug("Body: " + str(index))

	var body_texture = bodies[index]
	body_sprite.texture = body_texture


func _randomize_hands():
	if hands.size() <= 0:
		return

	var index = randi() % hands.size()
	# print_debug("Hands: " + str(index))

	var hand_texture = hands[index]
	left_hand_sprite.texture = hand_texture
	right_hand_sprite.texture = hand_texture
