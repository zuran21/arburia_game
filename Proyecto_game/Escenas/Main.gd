extends Area2D

const move_speed = 300.0
const screen_width = 1990# alto y ancho del area de juego
const screen_height = 1024
var fire_shoot = true
var DisparoScene = preload("res://Escenas/Disparo.tscn") # cargar escena
var mob_atackScene = preload("res://Escenas/explocion.tscn")
signal golpe
var limite

func _ready():
	hide()
	limite = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_key_pressed(KEY_UP):
		direction.y = -1
	if Input.is_key_pressed(KEY_DOWN):
		direction.y = 1
	if Input.is_key_pressed(KEY_LEFT):
		direction.x = -1
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x = 1
	
	if Input.is_key_pressed(KEY_ALT) and fire_shoot:
		shoot()
	
	if direction.length() >0:
		direction = direction.normalized()
		
		position.x = clamp(position.x, 0, screen_width)
		position.y = clamp(position.y, 0, screen_height)
	
	position += move_speed * direction * delta

func shoot():#centrar el disparo
	fire_shoot = false
	var disparo_instance = DisparoScene.instance()
	disparo_instance.position = position
	get_parent().add_child(disparo_instance)
	$Timer.start()

func _on_Timer_timeout():
	fire_shoot = true
	$Timer.stop()


func _on_Area2D_area_entered(area):#colision de golpe con ataques enemigos
	if area.is_in_group("mob_atack"):
		var explosion_instance = mob_atackScene.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
		$disparo.play()
		queue_free()
func inicio(pos):
	position = pos
	show()#muestra el player
	$CollisionShape2D.disabled = false;
