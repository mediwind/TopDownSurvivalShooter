extends Area2D

var speed : int = 500
var direction : Vector2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * direction * delta
	if position.x < 0 or position.x > get_viewport_rect().size.x or position.y < 0 or position.y > get_viewport_rect().size.y:
		queue_free()


func _on_body_entered(body:Node2D):
	if body.name == "World":
		queue_free()
	else:
		if body.alive:
			body.die()
			queue_free()
