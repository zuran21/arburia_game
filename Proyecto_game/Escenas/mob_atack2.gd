extends Area2D

const move_speed = 180.0
var mob_atackScene = preload("res://Escenas/explocion.tscn")

func _process(delta):
	position -= Vector2(move_speed * delta, 0)
	if position.x < -100:
		queue_free()



#explocion de mobs
func _on_mob_atack2_area_entered(area):
	if area.is_in_group("Disparo"):
		var explosion_instance = mob_atackScene.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)	
		
		queue_free()
