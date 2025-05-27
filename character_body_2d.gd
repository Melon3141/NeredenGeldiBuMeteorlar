extends CharacterBody2D

@export var öldün : PackedScene

var öldün_inst
var SPEED = 300.0
var VERT_SPEED = 100.0
var STOP = false
signal patlama

var karadelik : Node2D
var kamera

func _ready() -> void:
	kamera = get_node("../Camera2D")
	öldün_inst = öldün.instantiate()
	$Patlama.visible = false
	$Sprite2D.visible = true
	patlama.connect(_patlama)

func _physics_process(_delta: float) -> void:
	karadelik = get_tree().current_scene.get_node("Karadelik")
	if !STOP:
		if karadelik != null && global_position.distance_to(karadelik.global_position) < 700:
			global_position = global_position.move_toward(karadelik.global_position, 3.5)
		var directionX := Input.get_axis("ui_left", "ui_right")
		var directionY := Input.get_axis("ui_up", "ui_down")
		velocity.x = directionX * SPEED 
		velocity.y = directionY * VERT_SPEED
		$AnimationPlayer.play("default")
		transform.origin.x = clamp(transform.get_origin().x, 0, (kamera.global_transform.get_origin().x) * 2)
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
func _patlama():
	STOP = true
	$Sprite2D.visible = false
	$Patlama.visible = true
	$AnimationPlayer.play("patlama")
	await $AnimationPlayer.animation_finished
	get_node("../Camera2D").add_child(öldün_inst)
	pass


func _on_shield_pressed() -> void:
	pass # Replace with function body.
