class_name FootstepsRandomizer extends AudioStreamPlayer2D


@export var character: Character


var terrain_tiles: TileMapLayer 


func _ready() -> void:
	terrain_tiles = character.terrain_tiles


func play_footstep() -> void:
	stream = _fetch_random_footstep()
	if stream:
		play()
	else:
		stop()


func _fetch_random_footstep() -> AudioStream:
	if !terrain_tiles:
		return null
	
	var tile_coords: Vector2i = terrain_tiles.local_to_map(character.position)
	var tile_data: TileData = terrain_tiles.get_cell_tile_data(tile_coords)

	var footsteps: Array[AudioStream] = []
	if tile_data:
		var footsteps_resource: FootstepsResource = tile_data.get_custom_data("Footsteps")
		footsteps = footsteps_resource.footsteps_sfx

	if footsteps.size() > 0:
		return footsteps.pick_random()
	else:
		return null
