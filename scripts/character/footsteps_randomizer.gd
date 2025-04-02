class_name FootstepsRandomizer extends AudioStreamPlayer2D


@onready var character: Character = $"../../"

var floor_tiles: TileMapLayer 


func _ready() -> void:
	floor_tiles = character.floor_tiles


func play_footstep() -> void:
	stream = _fetch_random_footstep()
	play()


func _fetch_random_footstep() -> AudioStream:
	if !floor_tiles:
		return null
	
	var tile_coords: Vector2i = floor_tiles.local_to_map(character.position)
	var tile_data: TileData = floor_tiles.get_cell_tile_data(tile_coords)

	var footsteps: Array[AudioStream] = []
	if tile_data:
		var footsteps_resource: FootstepsResource = tile_data.get_custom_data("Footsteps")
		footsteps = footsteps_resource.footsteps_sfx

	return footsteps.pick_random()