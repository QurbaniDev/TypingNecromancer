extends Node2D

@export var enemy_scene: PackedScene

@export var min_x := -300
@export var max_x := 300

@export var min_y := -200
@export var max_y := 200

@export var spawn_interval := 1.5

var enemies = []

func _ready():
	spawn_loop()

func spawn_loop():
	
	while true:
		spawn_enemy()
		await get_tree().create_timer(spawn_interval).timeout

func spawn_enemy():

	var enemy = enemy_scene.instantiate()

	var random_x = randf_range(min_x, max_x)
	var random_y = randf_range(min_y, max_y)

	enemy.position = Vector2(random_x, random_y)

	add_child(enemy)
	enemies.append(enemy)

func _process(delta):
	enemies = enemies.filter(func(e):
		return is_instance_valid(e)
	)

	if enemies.is_empty():
		return

	if Global.Kill == true:  # your condition
		var oldest = enemies.pop_front()
		oldest.queue_free()
		Global.Kill = false;
