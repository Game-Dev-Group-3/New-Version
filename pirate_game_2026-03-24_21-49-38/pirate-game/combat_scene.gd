extends Node2D

@onready var global = get_node("/root/Inventory")

@export var crewmates: Array
@export var enemies: Array

var player_turn = true

var turn = 0

var state = 0
#0 = player choosing what to do (attack, use item, etc)
#1 = player selecting target
#3 = enemy turn

@onready var button = preload("res://enemy_targetable.tscn")

func _ready():
	for Creature in enemies:
		var b = button.instantiate()
		b.texture_normal = Creature.texture
		b.scene = self
		b.index = enemies.find(Creature)
		$enemies/HBoxContainer.add_child(b)
	for Creature in crewmates:
		var b = button.instantiate()
		b.texture_normal = Creature.texture
		b.scene = self
		b.index = crewmates.find(Creature)
		$crewmates/HBoxContainer.add_child(b)

func next_turn():
	turn += 1
	
	if player_turn and turn >= crewmates.size:
		player_turn = false
		turn = 0
	elif !player_turn and turn >= enemies.size:
		player_turn = true
		turn = 0

func change_state(i):
	if i == 0:
		$CenterContainer.visible = true
	else:
		$CenterContainer.visible = false


func _on_attack_button_down() -> void:
	global.attacker = crewmates.find(turn)
	change_state(1)
