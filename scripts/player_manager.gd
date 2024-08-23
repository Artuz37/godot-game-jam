extends Node

var hp = 10
var money = 0
var level = 1
var exp = 0
var immunity = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func add_exp(amount: int) -> void:
	exp += amount
	if exp > 10:
		level =+ exp / 10
		exp = exp % 10
	print("Level up! Your level is now %s" % level)
	
func deal_damage(amount: int) -> void:
	hp -= amount
	if hp < 0:
		print("YOU DIED")
		get_tree().reload_current_scene()
