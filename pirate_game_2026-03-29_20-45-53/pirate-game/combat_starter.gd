extends Area2D

@onready var combat_scene = preload("res://combat_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	var c = combat_scene.instantiate()
	c.global_position = body.global_position
	get_parent().add_child(c)
	get_parent().process_mode = PROCESS_MODE_DISABLED
	queue_free()
