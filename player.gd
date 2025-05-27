extends Node2D

var SPEED = 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Mekik.connect("patlama", _patlama)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += (-(SPEED)*delta)
	pass

func _patlama():
	SPEED = 0
