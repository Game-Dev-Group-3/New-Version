extends TextureButton

@onready var global = get_node("/root/Inventory")

var index = 0
#corresponds to index of relevant target in combat_scene's "enemies" array

var scene

var isplayer = false


func _on_pressed() -> void:
	global.target = scene.enemies[index]
	global.attacker.attack(global.target)
	$Label.text = str(scene.enemies[index].hp)
	scene.change_state(0)
	scene.next_turn()
