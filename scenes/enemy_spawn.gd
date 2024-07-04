extends Node2D

@onready var main = get_parent()

var goblin_scene := preload("res://goblin.tscn")
var spawn_points := []


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i.position)


func _on_timer_timeout():
	# pick a random spawn point
	var spawn = spawn_points[randi() % spawn_points.size()]
	# spawn enemy
	var goblin = goblin_scene.instantiate()
	goblin.position = spawn
	main.add_child(goblin)
