extends Node

var wave : int
var lives : int
var max_enemies : int


# Called when the node enters the scene tree for the first time.
func _ready():
	wave = 1
	lives = 3
	max_enemies = 10
	$HUD/LivesLabel.text = "X " + str(lives)
	$HUD/WaveLabel.text = "WAVE: " + str(wave)
	$HUD/EnemiesLabel.text = "X " + str(max_enemies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_spawn_hit_p():
	lives -= 1
	$HUD/LivesLabel.text = "X " + str(lives)
