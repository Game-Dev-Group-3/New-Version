extends Area2D

@onready var inventory = get_node("/root/Inventory")
@export var item_path: String

var item

func _ready():
	item = (load(item_path).instantiate())


func activate():
	
	#if inventory.items.has(item):
		#print("hey")
		#inventory.items.get(inventory.items.find(item)).value += 1
	#else:
		#inventory.items.append(item)
	
	for i in inventory.items:
		if i.id == item.id:
			i.value += 1
			item = null
			break
	if item != null:
		inventory.items.append(item)
	
	queue_free()
