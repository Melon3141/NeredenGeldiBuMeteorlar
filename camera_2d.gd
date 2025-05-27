extends Camera2D

var shake_power = 4
var shake_time = 0.4
var isShake = false
var curPos
var elapsedtime = 0

func _ready():
	randomize()
	curPos = offset

func _process(delta):
	pass

func shake(dist: float, delta):
	offset =  Vector2(randf(), randf()) * ((500-dist) / 100)
