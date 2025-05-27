extends AudioStreamPlayer

var sıra = 0
var label : Label
var songs = [
	preload("res://sfx/core.mp3"),
	preload("res://sfx/cyhtm.mp3"),
	preload("res://sfx/the-world-revolving.mp3")
]
var isimleri = [
	"Toby Fox - CORE",
	"Ludwig Göransson - Can You Hear The Music",
	"Toby Fox - THE WORLD REVOLVING"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = songs[sıra]
	label.text = isimleri[sıra]
	play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sol_pressed() -> void:
	if sıra > 0:
		stop()
		sıra -= 1
		stream = songs[sıra]
		label.text = isimleri[sıra]
		play()
	pass # Replace with function body.


func _on_sağ_pressed() -> void:
	if sıra < songs.size() - 1:
		stop()
		sıra += 1
		stream = songs[sıra]
		label.text = isimleri[sıra]
		play()
	pass # Replace with function body.
