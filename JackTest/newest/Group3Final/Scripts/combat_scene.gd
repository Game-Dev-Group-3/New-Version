extends Node2D

@onready var global = get_node("/root/Inventory")

@export var crewmates: Array[Creature]
@export var enemies: Array[Creature]

var player_turn = true

var turn = 0

var state = 0
#0 = player choosing what to do (attack, use item, etc)
#1 = player selecting target
#3 = enemy turn

@onready var button = preload("res://enemy_targetable.tscn")

func _ready():
	for Crea in enemies:
		var b = button.instantiate()
		b.texture_normal = Crea.texture
		b.scene = self
		b.index = enemies.find(Crea)
		$enemies/HBoxContainer.add_child(b)
	for Crea in crewmates:
		var b = button.instantiate()
		b.texture_normal = Crea.texture
		b.scene = self
		b.index = crewmates.find(Crea)
		$crewmates/HBoxContainer.add_child(b)

func next_turn():
	turn += 1
	
	if player_turn == true and turn >= crewmates.size():
		player_turn = false
		turn = 0
	elif player_turn == false and turn >= enemies.size():
		player_turn = true
		turn = 0

func change_state(i):
	if i == 0:
		$CenterContainer.visible = true
	else:
		$CenterContainer.visible = false
	
	if i == 1:
		for c in $enemies/HBoxContainer.get_children():
			c.disabled = false
	else:
		for c in $enemies/HBoxContainer.get_children():
			c.disabled = true


func _on_attack_button_down() -> void:
	global.attacker = crewmates[turn]
	change_state(1)
