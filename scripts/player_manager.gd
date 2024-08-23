extends Node

var max_hp = 10
var hp = 5
var money = 0
var level = 1
var exp = 0
var max_immunity: float = 2.0
var immunity: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if immunity > 0.0:
		immunity = max(immunity-delta, 0)
	
	
func add_exp(amount: int) -> void:
	exp += amount
	if exp > 10:
		level =+ exp / 10
		exp = exp % 10
	print("Level up! Your level is now %s" % level)
	
func deal_damage(amount: int) -> void:
	if immunity > 0:
		return
	hp -= amount
	if hp < 0:
		print("YOU DIED")
		get_tree().reload_current_scene()
	print("Dostałes hita za %s" % amount)
	print("Masz teraz %s hp" % hp)
	immunity = max_immunity

func heal(amount: int) -> void:
	hp += amount
	print("healed")
	hp = min(hp, max_hp)
