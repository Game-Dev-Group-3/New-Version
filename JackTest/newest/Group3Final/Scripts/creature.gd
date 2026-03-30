extends Sprite2D
class_name Creature

#This is used for both player controlled characters and enemies during combat

@export var maxHp = 10
@export var hp = 10

@export var MIN_DAMAGE = 1
@export var MAX_DAMAGE = 4

func _ready():
	visible = false

func attack(target):
	target.hurt(randi_range(MIN_DAMAGE, MAX_DAMAGE))

func hurt(damage):
	hp -= damage
