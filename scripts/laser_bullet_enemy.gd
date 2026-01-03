extends LaserBullet

func _on_area_2d_body_entered(body: Node2D):
	
	if body.name == "Player":
		body.take_damage(damage)
