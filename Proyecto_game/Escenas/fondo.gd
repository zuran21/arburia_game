extends Sprite
const move_speed = -250.0
const screen_width = 3005


#movimiento de pantalla
func _process(delta):
	position += Vector2(move_speed * delta, 0)
		#limite de pantalla + duplicar
	if position.x <= -screen_width:
		position.x += screen_width

