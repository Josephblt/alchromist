extends CharacterBody2D
class_name Character

@export var bodies: Array[Texture2D] = []
@export var hands: Array[Texture2D] = []

@onready var body_sprite: Sprite2D = $Body/BodySprite
@onready var left_hand_sprite: Sprite2D = $LeftHand/LeftHandSprite
@onready var right_hand_sprite: Sprite2D = $RightHand/RightHandSprite


func _ready():
    _randomize_body()
    _randomize_hands()


func _randomize_body():
    if bodies.size() > 0:
        var body_texture = bodies[randi() % bodies.size()]
        body_sprite.texture = body_texture
        print("Body texture: ", body_texture.resource_path)


func _randomize_hands():
    if hands.size() > 0:
        var hand_texture = hands[randi() % hands.size()]
        left_hand_sprite.texture = hand_texture
        right_hand_sprite.texture = hand_texture
        print("Hand texture: ", hand_texture.resource_path)
