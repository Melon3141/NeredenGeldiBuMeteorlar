extends Label

var point = 0
var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = get_node("/root/Node2D/Timer")
	timer.timeout.connect(_on_timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(point)
func  _on_timeout():
	point += 1
