extends Area2D
const move_speed = 650.0
const screen_width = 1990
const screen_height = 860

func _process(delta):#eliminar fuego despues de colisionar
	position += Vector2(move_speed * delta, 0)
	if position.x > screen_width +10:
		$disparo.play()
		queue_free()
		

func _on_Disparo_area_entered(area):
	if area.is_in_group("mob_atack"):
		$disparo.play()
		queue_free()
		


func _on_Disparo_area_entered2(area):
	if area.is_in_group("mob_atack2"):
		$disparo.play()
		queue_free()
