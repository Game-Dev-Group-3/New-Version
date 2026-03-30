extends TextureButton

@onready var global = get_node("/root/Inventory")
@onready var timer = $Timer

var index = 0
#corresponds to index of relevant target in combat_scene's "enemies" array

var scene

var isplayer = false

var targets: Array[Creature]

func _ready():
	if !isplayer:
		$Label.text = str(scene.enemies[index].hp)

func _process(delta: float) -> void:
	
	
	if isplayer:
		if scene.crewmates[index] == null:
			queue_free()
		else:
			$Label.text = str(scene.crewmates[index].hp)
		
		if scene.player_turn and scene.turn == index:
			if $Sprite2D.visible == false:
				$Sprite2D.visible = true
		elif $Sprite2D.visible:
			$Sprite2D.visible = false
	else:
		if scene.enemies[index] == null:
			queue_free()
		
		if !scene.player_turn and scene.turn == index:
			if $Sprite2D.visible == false:
				$Sprite2D.visible = true
		elif $Sprite2D.visible:
			$Sprite2D.visible = false

func _on_pressed() -> void:
	global.target = scene.enemies[index]
	global.attacker.attack(global.target)
	$Label.text = str(scene.enemies[index].hp)
	scene.change_state(0)
	scene.next_turn()
	if global.target.hp <= 0:
		scene.enemiesamount -= 1


func _on_timer_timeout() -> void:
	targets.clear()
	for i in scene.crewmates:
		if i != null:
			targets.append(i)
	
	if !targets.is_empty():
		global.target = targets.pick_random()
		global.attacker.attack(global.target)
		scene.next_turn()
	
