@tool
class_name ZOrderResource
extends Resource


enum Z_LAYERS {
    LIMITS_FENCES,
    LIMITS_TREES,
    LIMITS_WALLS,
    PLAYER_BODY,
    PLAYER_HANDS,
    PROPS_BED_DOUBLE,
    PROPS_BED_SINGLE,
    PROPS_CARPET,
    PROPS_CHAIR,
    PROPS_CHEST,
    PROPS_CRADLE,
    PROPS_TABLE_SMALL,
    TERRAIN_GRASS,
    TERRAIN_GRAVEL,
    TERRAIN_STONE,
    TERRAIN_WOOD,    
}


@export_tool_button("Sort Z-Order", "YSort") var update_button = _update_z_indexes

@export_subgroup("Characters")
@export var player_scene: PackedScene

@export_subgroup("Props")
@export var props_bed_double_scene: PackedScene
@export var props_bed_single_scene: PackedScene
@export var props_carpet_scene: PackedScene
@export var props_chair_scene: PackedScene
@export var props_chest_scene: PackedScene
@export var props_cradle_scene: PackedScene
@export var props_table_small_scene: PackedScene

@export_subgroup("Tilesets")
@export var limits_tileset: TileSet
@export var terrains_tileset: TileSet

@export_subgroup("Z-Order")
@export var z_order_list: Array[Z_LAYERS] = [
    Z_LAYERS.TERRAIN_GRASS,
    Z_LAYERS.TERRAIN_GRAVEL,
    Z_LAYERS.TERRAIN_STONE,
    Z_LAYERS.TERRAIN_WOOD,
    Z_LAYERS.LIMITS_FENCES,
    Z_LAYERS.LIMITS_TREES,
    Z_LAYERS.PROPS_BED_SINGLE,
    Z_LAYERS.PROPS_BED_DOUBLE,
    Z_LAYERS.PROPS_CARPET,
    Z_LAYERS.PROPS_CHAIR,
    Z_LAYERS.PROPS_CHEST,
    Z_LAYERS.PROPS_CRADLE,
    Z_LAYERS.PROPS_TABLE_SMALL,
    Z_LAYERS.PLAYER_BODY,
    Z_LAYERS.PLAYER_HANDS,
    Z_LAYERS.LIMITS_WALLS,
]


func _update_z_indexes() -> void:
    _update_limits_tileset()
    _update_player()
    _update_props_bed_double()
    _update_props_bed_single()
    _update_props_carpet()
    _update_props_chair()
    _update_props_chest()
    _update_props_cradle()
    _update_props_table_small()
    _update_terrains_tileset()


func _update_limits_tileset() -> void:
    _update_tileset(limits_tileset, 0, Z_LAYERS.LIMITS_FENCES)
    _update_tileset(limits_tileset, 1, Z_LAYERS.LIMITS_TREES)
    _update_tileset(limits_tileset, 2, Z_LAYERS.LIMITS_WALLS)
    print("Limits tileset updated.")
    print("Fences: " + str(z_order_list.find(Z_LAYERS.LIMITS_FENCES)))
    print("Trees: " + str(z_order_list.find(Z_LAYERS.LIMITS_TREES)))
    print("Walls: " + str(z_order_list.find(Z_LAYERS.LIMITS_WALLS)))


func _update_player() -> void:
    var player = _load_scene(player_scene)
    var player_body = player.get_node("BodyShape/BodySprite")
    player_body.z_index = z_order_list.find(Z_LAYERS.PLAYER_BODY)
    var player_left_hand = player.get_node("LeftHand/LeftHandShape/LeftHandSprite")
    player_left_hand.z_index = z_order_list.find(Z_LAYERS.PLAYER_HANDS)
    var player_right_hand = player.get_node("RightHand/RightHandShape/RightHandSprite")
    player_right_hand.z_index = z_order_list.find(Z_LAYERS.PLAYER_HANDS)
    _save_scene(player, player_scene.resource_path)
    print("Player scene updated.")
    print(player_body.name + ": " + str(player_body.z_index))
    print(player_left_hand.name + ": " + str(player_left_hand.z_index))
    print(player_right_hand.name + ": " + str(player_right_hand.z_index))


func _update_props_bed_double() -> void:
    var bed_double = _load_scene(props_bed_double_scene)
    var bed_double_sprite = bed_double.get_node("Sprite")
    bed_double_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_BED_DOUBLE)
    _save_scene(bed_double, props_bed_double_scene.resource_path)
    print("Bed double scene updated.")
    print(bed_double_sprite.name + ": " + str(bed_double_sprite.z_index))


func _update_props_bed_single() -> void:
    var bed_single = _load_scene(props_bed_single_scene)
    var bed_single_sprite = bed_single.get_node("Sprite")
    bed_single_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_BED_SINGLE)
    _save_scene(bed_single, props_bed_single_scene.resource_path)
    print("Bed single scene updated.")
    print(bed_single_sprite.name + ": " + str(bed_single_sprite.z_index))


func _update_props_carpet() -> void:
    var carpet = _load_scene(props_carpet_scene)
    var carpet_sprite = carpet.get_node("Sprite")
    carpet_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_CARPET)
    _save_scene(carpet, props_carpet_scene.resource_path)
    print("Carpet scene updated.")
    print(carpet_sprite.name + ": " + str(carpet_sprite.z_index))


func _update_props_chair() -> void:
    var chair = _load_scene(props_chair_scene)
    var chair_sprite = chair.get_node("Sprite")
    chair_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_CHAIR)
    _save_scene(chair, props_chair_scene.resource_path)
    print("Chair scene updated.")
    print(chair_sprite.name + ": " + str(chair_sprite.z_index))


func _update_props_chest() -> void:
    var chest = _load_scene(props_chest_scene)
    var chest_sprite = chest.get_node("Sprite")
    chest_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_CHEST)
    _save_scene(chest, props_chest_scene.resource_path)
    print("Chest scene updated.")
    print(chest_sprite.name + ": " + str(chest_sprite.z_index))


func _update_props_cradle() -> void:
    var cradle = _load_scene(props_cradle_scene)
    var cradle_sprite = cradle.get_node("Sprite")
    cradle_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_CRADLE)
    _save_scene(cradle, props_cradle_scene.resource_path)
    print("Cradle scene updated.")
    print(cradle_sprite.name + ": " + str(cradle_sprite.z_index))


func _update_props_table_small() -> void:
    var table_small = _load_scene(props_table_small_scene)
    var table_small_sprite = table_small.get_node("Sprite")
    table_small_sprite.z_index = z_order_list.find(Z_LAYERS.PROPS_TABLE_SMALL)
    _save_scene(table_small, props_table_small_scene.resource_path)
    print("Table small scene updated.")
    print(table_small_sprite.name + ": " + str(table_small_sprite.z_index))


func _update_terrains_tileset() -> void:
    _update_tileset(terrains_tileset, 0, Z_LAYERS.TERRAIN_GRASS)
    _update_tileset(terrains_tileset, 1, Z_LAYERS.TERRAIN_GRAVEL)
    _update_tileset(terrains_tileset, 2, Z_LAYERS.TERRAIN_STONE)
    _update_tileset(terrains_tileset, 3, Z_LAYERS.TERRAIN_WOOD)
    print("Terrains tileset updated.")
    print("Grass: " + str(z_order_list.find(Z_LAYERS.TERRAIN_GRASS)))
    print("Gravel: " + str(z_order_list.find(Z_LAYERS.TERRAIN_GRAVEL)))
    print("Stone: " + str(z_order_list.find(Z_LAYERS.TERRAIN_STONE)))
    print("Wood: " + str(z_order_list.find(Z_LAYERS.TERRAIN_WOOD)))


func _load_scene(packedScene: PackedScene) -> Node:
    var scene: Node = packedScene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
    return scene


func _save_scene(scene: Node, path: String) -> void:
    var packedScene = PackedScene.new()
    var pack_result: int = packedScene.pack(scene)
    if pack_result == OK:
        var save_result = ResourceSaver.save(packedScene, path)
        if save_result != OK:
            push_error("An error occurred while saving the scene: " + path + " to disk.")


func _update_tileset(tileset: TileSet, source_id: int, z_layer: Z_LAYERS) -> void:
    var source: TileSetAtlasSource = tileset.get_source(source_id)
    var tile_count: int = source.get_tiles_count()

    for i in range(tile_count):
        var tile_id: Vector2 = source.get_tile_id(i)
        var z_index: int = z_order_list.find(z_layer)
        var alternative_tile_count: int = source.get_alternative_tiles_count(tile_id)
        for j in range(alternative_tile_count):
            var alt_tile_id: int = source.get_alternative_tile_id(tile_id, j)
            var alt_tile_data: TileData = source.get_tile_data(tile_id, alt_tile_id)
            alt_tile_data.z_index = z_index