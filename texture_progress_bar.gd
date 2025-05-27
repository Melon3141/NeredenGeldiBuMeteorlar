extends TextureProgressBar

var is_waiting = false
var mekik_sprite : Sprite2D

func _ready() -> void:
	mekik_sprite = $"/root/Node2D/Oyuncu/Mekik/Sprite2D"

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_select") and value > 0 and not is_waiting:
		start_blink()
	
func start_blink() -> void:
	is_waiting = true
	value -= 25
	mekik_sprite.self_modulate = Color.from_rgba8(255, 255, 255, 100)
	mekik_sprite.get_node("../CollisionShape2D").disabled = true
	
	await get_tree().create_timer(1.0).timeout
	is_waiting = false
	mekik_sprite.self_modulate = Color.from_rgba8(255, 255, 255, 255)
	mekik_sprite.get_node("../CollisionShape2D").disabled = false
func _on_shield_button_down() -> void:
	Input.action_press("ui_select")
	pass # Replace with function body.

func _on_shield_button_up() -> void:
	Input.action_release("ui_select")
	pass # Replace with function body.
