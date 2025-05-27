extends Node2D

# Called when the node enters the scene tree for the first time.
var oyuncu
var sprites = [
	preload("res://resimler/asteroitler/1.png"),
	preload("res://resimler/asteroitler/2.png"),
	preload("res://resimler/asteroitler/3.png")
]

func _ready() -> void:
	$CharacterBody2D/Sprite2D.texture = sprites[randi_range(0, 2)]
	look_at(get_node("../Mekik").global_position)
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CharacterBody2D/AnimationPlayer.play("fırıldak")
	move_local_x(5)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Mekik":
		get_node("../Mekik").emit_signal("patlama")
	pass # Replace with function body.
