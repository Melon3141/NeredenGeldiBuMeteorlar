extends Node2D

var oyuncu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oyuncu = get_node("/root/Node2D/Oyuncu/Mekik")
	pass # Replace with function body. 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mekik":
		oyuncu.emit_signal("patlama")
	pass # Replace with function body.
