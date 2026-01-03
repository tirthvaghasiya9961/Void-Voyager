extends LaserBullet

func _on_area_2d_body_entered(body):
	
	if body.name == "Alien":
		body.take_damage(damage)
