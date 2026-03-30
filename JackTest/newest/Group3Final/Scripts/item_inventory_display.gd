extends TextureButton

@onready var label = $Label
var text: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	owner = get_parent()
	#print(get_parent())
	label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
