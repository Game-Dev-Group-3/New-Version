extends Area2D
@export var crewmates: Array[Creature]
@onready var global = get_node("/root/Inventory")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	global.crewmates = crewmates
	for i in crewmates:
		remove_child(i)
