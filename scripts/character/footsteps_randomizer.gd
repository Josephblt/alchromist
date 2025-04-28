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
		push_warning("FootstepsRandomizer: No terrain tiles assigned.")
		return null
	
	var tile_coords: Vector2i = terrain_tiles.local_to_map(terrain_tiles.to_local(character.position))
	var tile_data: TileData = terrain_tiles.get_cell_tile_data(tile_coords)
	if !tile_data:
		push_warning("FootstepsRandomizer: No tile data found at coordinates: ", tile_coords)
		return null
	
	var footsteps_resource: FootstepsResource = tile_data.get_custom_data("Footsteps")
	if !footsteps_resource:
		push_warning("FootstepsRandomizer: No footsteps resource found or empty.")
		return null
	
	var footsteps: Array[AudioStream] = footsteps_resource.footsteps_sfx
	if !footsteps or footsteps.size() == 0:
		push_warning("FootstepsRandomizer: No footsteps found in the resource.")
		return null
	
	return footsteps.pick_random()
