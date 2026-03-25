extends TextureButton

@onready var global = get_node("/root/Inventory")

var index = 0
#corresponds to index of relevant target in combat_scene's "enemies" array

var scene

func _on_pressed() -> void:
	global.target = scene.enemies.find(index)
	global.attacker.attack()
