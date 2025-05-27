extends Control

var musics = [
	preload("res://sfx/core.mp3"),
	preload("res://sfx/another-medium.mp3"),
	preload("res://sfx/finale.mp3"),
	preload("res://sfx/hop-and-dr.mp3"),
	preload("res://sfx/notn.mp3"),
	preload("res://sfx/the-world-revolving.mp3")
]

var isimler = [
	"Toby Fox - Core",
	"Toby Fox - Another Medium",
	"Toby Fox - Finale",
	"Toby Fox - Hopes And Dreams",
	"Night of Nights",
	"Toby Fox - THE WORLD REVOLVING"
]
var index = 0

func _ready() -> void:
	$AudioStreamPlayer.stream = musics[index]
	$AudioStreamPlayer.play()

func _process(delta: float) -> void:
	$Label.text = isimler[index]
	if Input.is_action_just_pressed("ui_mus_right") and index < musics.size() - 1:
		index += 1
		$AudioStreamPlayer.stream = musics[index]
		$AudioStreamPlayer.play()
	elif Input.is_action_just_pressed("ui_mus_left") and index > 0:
		index -= 1
		$AudioStreamPlayer.stream = musics[index]
		$AudioStreamPlayer.play()


func _on_sol_pressed() -> void:
	if index > 0:
		index -= 1
		$AudioStreamPlayer.stream = musics[index]
		$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_sağ_pressed() -> void:
	if index < musics.size() - 1:
		index += 1
		$AudioStreamPlayer.stream = musics[index]
		$AudioStreamPlayer.play()
	pass # Replace with function body.
