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

@onready var body_sprite: Sprite2D = $Body/BodySprite
@onready var left_hand_sprite: Sprite2D = $LeftHand/LeftHandSprite
@onready var right_hand_sprite: Sprite2D = $RightHand/RightHandSprite


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
    move_and_slide()


func _randomize_body():
    if bodies.size() <= 0:
        return
    
    var body_texture = bodies[randi() % bodies.size()]
    body_sprite.texture = body_texture


func _randomize_hands():
    if hands.size() <= 0:
        return

    var hand_texture = hands[randi() % hands.size()]
    left_hand_sprite.texture = hand_texture
    right_hand_sprite.texture = hand_texture
