extends Node2D
var Score
var atack_Scene = preload("res://Escenas/mob_atack.tscn")
var atack2_Scene = preload("res://Escenas/mob_atack2.tscn")
const screen_height = 1024
export (PackedScene) var nivel1
export (PackedScene) var nivel2


func _on_inicioatake_timeout():#posicion y movimiento de ataques
	var atack_instance = atack_Scene.instance()
	var y = rand_range(0, screen_height)
	var x = $atak_position.position.x
	atack_instance.position = Vector2(x,y)
	add_child(atack_instance)
	

		
func load_level():
	var neulevel
	if (Gamehandler.nivel_actual == nivel1):
		neulevel = nivel1.instance()
	elif(Gamehandler.nivel_actual == nivel2):
		neulevel = nivel2.instance()
		add_child(neulevel)
func game_over():
	
	$ScoreTimer.stop()
	$inicioatake.stop()
	$Menu.game_over()
	$audiomuerte.play()
	$audio_intro.stop()
func nuevo_juego():
	
	Score = 0
	$player.inicio($posini.position)#inicio del player
	$InicioTimer.start()
	$Menu.mostrar_msm("Preparate!!")
	$Menu.update_score(Score)
	$audio_intro.play()
	


func _on_ScoreTimer_timeout():
	Score +=10
	$Menu.update_score(Score)


func _on_InicioTimer_timeout():
	$ScoreTimer.start()
	$inicioatake.start()

#mob 2
func _on_inicioatake2_timeout():
	var atack2_instance = atack2_Scene.instance()
	var y = rand_range(0, screen_height)
	var x = $atack_position2.position.x
	atack2_instance.position = Vector2(x,y)
	add_child(atack2_instance)
