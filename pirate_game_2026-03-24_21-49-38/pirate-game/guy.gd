extends CharacterBody2D

var horizontal = 0
var vertical = 0
var speed = 200

var interactable_target

func _physics_process(delta: float) -> void:
	horizontal = Input.get_action_strength("right") - Input.get_action_strength("left")
	vertical = Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity = lerp(Vector2(velocity.x, velocity.y), Vector2(horizontal, vertical).normalized() * speed, 0.9)
	
	move_and_slide()

func _process(delta):
	interactable_target = null
	
	if $ShapeCast2D.is_colliding():
		if $ShapeCast2D.get_collider(0) != null:
			if $ShapeCast2D.get_collider(0).is_in_group("interactable"): # and interactable_target == null:
				interactable_target = $ShapeCast2D.get_collider(0)
	
	if interactable_target != null:
		if $Sprite2D2.visible == false:
			$Sprite2D2.visible = true
		$Sprite2D2.global_position = interactable_target.global_position
	elif $Sprite2D2.visible == true:
		$Sprite2D2.visible = false
	
	if Input.is_action_just_pressed("interact") and interactable_target != null:
		interactable_target.activate()
