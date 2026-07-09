extends Node2D

@export var reagent_scene: PackedScene

const PER_ROW := 6
const MAX_REAGENTS := 24
const CELL_W := 130
const CELL_H := 145

var spawned_reagents: Array[String] = []


func clear_shelf():
	spawned_reagents.clear()

	for child in get_children():
		child.queue_free()


func spawn_reagents(reagents: Array):
	for reagent in reagents:
		add_reagent_to_shelf(reagent)


func animate_result_to_shelf(reagent: String, start_position: Vector2):
	var id = ChemistryUtils.get_formula(reagent)
	var reagent_name = ChemistryUtils.get_reagent_name(id)

	var texture_path = "res://assets/sprites/reagentsSprites/" + reagent_name + ".png"
	var texture = load(texture_path)

	if texture == null:
		#add_reagent_to_shelf(id)
		GameEvents.reagent_discovered.emit(id)
		return

	var sprite := Sprite2D.new()
	sprite.texture = texture
	sprite.global_position = start_position
	sprite.scale = Vector2(6, 6)
	sprite.centered = true

	get_tree().current_scene.add_child(sprite)

	var target_pos = get_next_slot_global_position()
	var tween = create_tween()

	tween.tween_property(sprite, "global_position", target_pos, 0.6)

	tween.tween_callback(func():
		sprite.queue_free()
		add_reagent_to_shelf(id)
		GameEvents.reagent_discovered.emit(id)
	)


func add_reagent_to_shelf(reagent_name: String):
	var id = ChemistryUtils.get_formula(reagent_name)

	if reagent_already_spawned(id):
		return

	if spawned_reagents.size() >= MAX_REAGENTS:
		return

	var index = spawned_reagents.size()
	spawned_reagents.append(id)

	var item = reagent_scene.instantiate()
	item.setup(ChemistryUtils.get_reagent_name(id))

	var row = index / PER_ROW
	var col = index % PER_ROW

	item.position = Vector2(
		col * CELL_W,
		row * CELL_H
	)

	add_child(item)


func reagent_already_spawned(reagent_name: String) -> bool:
	var id = ChemistryUtils.get_formula(reagent_name)
	return spawned_reagents.has(id)


func get_next_slot_global_position() -> Vector2:
	var index = spawned_reagents.size()

	if index >= MAX_REAGENTS:
		return global_position

	var row = index / PER_ROW
	var col = index % PER_ROW

	var local_pos = Vector2(
		col * CELL_W + CELL_W * 0.5,
		row * CELL_H + CELL_H * 0.5
	)

	return to_global(local_pos)
