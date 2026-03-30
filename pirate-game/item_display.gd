extends CenterContainer
@onready var inventory = get_node("/root/Inventory")
@onready var display = preload("res://item_inventory_display.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for Item in inventory.items:
		var d = display.instantiate()
		d.text = str(Item.value)
		d.texture_normal = Item.texture
		d.scale.x = Item.scale.x
		d.scale.y = Item.scale.y
		$HBoxContainer.add_child(d)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
