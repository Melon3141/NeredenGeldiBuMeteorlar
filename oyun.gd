extends Node2D

var pause_menu = preload("res://pause_menu.tscn")
var karadelik_inst : Node2D = preload("res://karadelik.tscn").instantiate()
var label: Label
var k_timer : Timer
var s_timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	k_timer = Timer.new()
	k_timer.wait_time = 5.0
	k_timer.timeout.connect(_karadelik_spawn)
	add_child(k_timer)
	
	s_timer = Timer.new()
	s_timer.wait_time = randi_range(7, 15)
	s_timer.one_shot = false
	s_timer.timeout.connect(_soru_spawn)
	add_child(s_timer)
	s_timer.start()
	
	label = $Oyuncu/Camera2D/Control/Label
	pause_menu = pause_menu.instantiate()
	$Timer.autostart = true
	$Timer.timeout.connect(_timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		$Oyuncu/Camera2D.add_child(pause_menu)
	if label.point == 10:
		k_timer.start()
	pass
		
func spawn_meteor():
	var center = $Oyuncu.position  # Ekran merkezi gibi düşün
	var radius = 1000               # Meteorlar bu uzaklıkta spawn olacak
	var angle = randf() * TAU      # TAU = 2 * PI = 360°
	var spawn_position = center + Vector2(cos(angle), sin(angle)) * radius
	
	var meteor_instance = preload("res://meteor.tscn").instantiate()
	meteor_instance.global_position = spawn_position
	meteor_instance.look_at($Oyuncu/Mekik.global_position)
	$Oyuncu.add_child(meteor_instance)
func _timeout():
	spawn_meteor()

func _on_texture_button_2_pressed() -> void:
	if $Oyuncu/Camera2D.find_child("PauseMenu") == null:
		$Oyuncu/Camera2D.add_child(pause_menu)
	pass # Replace with function body.

func _karadelik_spawn():
	karadelik_inst.global_position.x = randi_range(0, 1176)
	karadelik_inst.global_position.y = $Oyuncu.global_position.y - 70
	if find_child("Karadelik") == null:
		add_child(karadelik_inst)

func _soru_spawn():
	print("Test!")
	var soru_drop : Node2D = preload("res://soru_drop.tscn").instantiate()
	soru_drop.global_position.x = randi_range(0, 1176)
	soru_drop.global_position.y = $Oyuncu.global_position.y - 70
	add_child(soru_drop)
	s_timer.wait_time = randi_range(7, 15)
	pass
