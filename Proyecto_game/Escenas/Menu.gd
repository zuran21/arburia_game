extends CanvasLayer

signal iniciar




func mostrar_msm(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MsnTimer.start()
	
	
func game_over():
	mostrar_msm("Fin del Juego :El dragon murio:")
	yield($MsnTimer, "timeout")
	$Button.show()
	$Mensaje.text = ("Arburia")
	$Mensaje.show()

func update_score(puntos):
	$Score.text = str (puntos)


func _on_MsnTimer_timeout():
	$Mensaje.hide()
	


func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar")
