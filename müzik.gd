extends AudioStreamPlayer

var sıra = 0
var label : Label
var songs = [
	preload("res://sfx/core.mp3").instantiate_playback(),
	preload("res://sfx/cyhtm.mp3").instantiate_playback(),
	preload("res://sfx/the-world-revolving.mp3").instantiate_playback()
]
var isimleri = [
	"Toby Fox - CORE",
	"Ludwig Göransson - Can You Hear The Music",
	"Toby Fox - THE WORLD REVOLVING"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = get_parent().get_node("Camera2D/Kasetçalar/Label")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	stream = songs[sıra]
	label.text = isimleri[sıra]
	pass


func _on_sola_pressed() -> void:
	if sıra > 0:
		sıra -= 1
	pass # Replace with function body.


func _on_sağa_pressed() -> void:
	if sıra < len(songs) - 1:
		sıra += 1
	pass # Replace with function body.
