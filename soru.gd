extends Node2D

var soru_json = "res://sorular.json"
var json
var rand = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	json = load_json_file(soru_json)
	rand = randi_range(0, json.size() - 1)
	$RichTextLabel.text = json[rand]["soru"]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_json_file(filePath: String):
	var file = FileAccess.open(filePath, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())
	return parsed
	


func _on_doğru_pressed() -> void:
	if json[rand]["dogru_mu"] == true:
		$"/root/Node2D/Oyuncu/Camera2D/Control/TextureProgressBar".value = 100
		print("Tebrikler!")
		get_tree().paused = false
		get_parent().remove_child($".")
	else:
		$"/root/Node2D/Oyuncu/Mekik".emit_signal("patlama")
		get_tree().paused = false
		get_parent().remove_child($".")
	pass # Replace with function body.

func _on_yanlış_pressed() -> void:
	if json[rand]["dogru_mu"] == false:
		$"/root/Node2D/Oyuncu/Camera2D/Control/TextureProgressBar".value = 100
		print("Tebrikler!")
		get_tree().paused = false
		get_parent().remove_child($".")
	else:
		$"/root/Node2D/Oyuncu/Mekik".emit_signal("patlama")
		get_tree().paused = false
		get_parent().remove_child($".")
	pass # Replace with function body.
