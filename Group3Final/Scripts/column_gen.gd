extends Node2D

var island_amount = 1

var island = preload("res://selectable_island.tscn")

@export var stage = 1

@export var island_distance = 100.0

@export var activated = true

func _ready():
	island_amount = randi_range(2, 4)
	
	for i in range(island_amount):
		var isle = island.instantiate()
		isle.global_position = global_position
		
		isle.stage = stage
		
		if island_amount == 3:
			if i == 1:
				isle.global_position.y += island_distance
			elif i == 2:
				isle.global_position.y -= island_distance
		else:
			if i == 0:
				isle.global_position.y -= (island_distance / 2)
			elif i == 1:
				isle.global_position.y += (island_distance / 2)
			elif i == 2:
				isle.global_position.y -= ((island_distance / 2) + island_distance)
			elif i == 3:
				isle.global_position.y += ((island_distance / 2) + island_distance)
		
		if activated and get_parent().get_parent().level == 1:
			get_parent().get_parent().add_child.call_deferred(isle)
