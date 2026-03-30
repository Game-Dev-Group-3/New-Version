extends Node2D

@export var level = 0

func _ready():
	
	pass
	#print(level)

func save():
	level += 1
	#var node_to_save = self
	#var scene = PackedScene.new()
	#scene.pack(node_to_save)
	#ResourceSaver.save(scene, "res://my_scene.tscn")
	
	#pretty sure this is not being used for anything.
