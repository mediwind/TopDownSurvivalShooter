extends Node2D

@onready var main = get_parent()

signal hit_p

var goblin_scene := preload("res://scenes/goblin.tscn")
var spawn_points := []


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i.position)


func _on_timer_timeout():
	# check how many enemies have already been created
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() < get_parent().max_enemies:
		# pick a random spawn point
		var spawn = spawn_points[randi() % spawn_points.size()]
		# spawn enemy
		var goblin = goblin_scene.instantiate()
		goblin.position = spawn
		goblin.connect("hit_player", hit)
		main.add_child(goblin)
		goblin.add_to_group("enemies")


func hit():
	hit_p.emit()
