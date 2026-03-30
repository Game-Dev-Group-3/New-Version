extends Area2D

func activate():
	#var new_scene = load("res://my_scene.tscn")
	# Instance the scene
	#var my_scene = packed_scene.instantiate()
	#add_child(my_scene)
	
	#get_tree().change_scene_to_file("res://my_scene.tscn")
	
	var new_scene = ResourceLoader.load("user://my_scene.tscn")
	#add_child(new_scene.instantiate())
	get_tree().get_root().add_child(new_scene.instantiate())
	get_parent().queue_free()
