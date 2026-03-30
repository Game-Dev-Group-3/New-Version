extends Item


func activate(scene):
	scene.global.attacker = self
	scene.change_state(1)
	value -= 1
	if value <= 0:
		scene.global.items.erase(self)

func attack(target):
	target.hurt(randi_range(1, 12))
