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

@onready var display = preload("res://item_inventory_display.tscn")

var enemiesamount = 4

func _process(delta):
	if enemiesamount <= 0:
		end_combat()
	
	if player_turn and crewmates[turn] == null:
		next_turn()
	elif !player_turn and enemies[turn] == null:
		next_turn()

func _ready():
	crewmates = global.crewmates
	
	for Item in global.items:
		if Item.land_combat_ready:
			var d = display.instantiate()
			d.text = str(Item.value)
			d.texture_normal = Item.texture
			d.scale.x = Item.scale.x
			d.scale.y = Item.scale.y
			d.item = Item
			d.scene = self
			$inventory/HBoxContainer.add_child(d)
	
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
		b.isplayer = true
		$crewmates/HBoxContainer.add_child(b)
	
	enemiesamount = enemies.size()

func next_turn():
	turn += 1
	
	if player_turn == true and turn >= crewmates.size():
		player_turn = false
		change_state(3)
		turn = 0
	elif player_turn == false and turn >= enemies.size():
		player_turn = true
		change_state(0)
		turn = 0
	
	if !player_turn:
		for e in $enemies/HBoxContainer.get_children():
			if e.index == turn:
				e.timer.start()
				break

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

func end_combat():
	global.crewmates = crewmates
	get_parent().process_mode = PROCESS_MODE_INHERIT
	queue_free()
