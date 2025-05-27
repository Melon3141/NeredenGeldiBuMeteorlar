extends Node2D

var soru_tablo = preload("res://soru.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$"/root/Node2D/Oyuncu".add_child(soru_tablo)
	get_parent().remove_child($".")
	pass # Replace with function body.
