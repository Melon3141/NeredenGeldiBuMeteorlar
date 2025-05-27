extends Control

var mekik : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mekik = get_parent().get_node("../Mekik")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_üst_button_down() -> void:
	Input.action_press("ui_up")
	pass # Replace with function body.


func _on_alt_button_down() -> void:
	Input.action_press("ui_down")
	pass # Replace with function body.


func _on_sağ_button_down() -> void:
	Input.action_press("ui_right")
	pass # Replace with function body.


func _on_sol_button_down() -> void:
	Input.action_press("ui_left")
	pass # Replace with function body.


func _on_üst_button_up() -> void:
	Input.action_release("ui_up")
	pass # Replace with function body.


func _on_alt_button_up() -> void:
	Input.action_release("ui_down")
	pass # Replace with function body.


func _on_sağ_button_up() -> void:
	Input.action_release("ui_right")
	pass # Replace with function body.


func _on_sol_button_up() -> void:
	Input.action_release("ui_left")
	pass # Replace with function body.
