extends Area2D

export (String) var escena



func _on_portal_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://Escenas/"+escena+".tscn")
	pass # Replace with function body.
