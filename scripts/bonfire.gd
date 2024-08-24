extends Area2D

var player_present = false

var heal_timer: float = 0.0
var heal_interval: float = 3.0  # 3 seconds

func _process(delta: float) -> void:
	if player_present:
		heal_timer += delta
		if heal_timer >= heal_interval:
			PlayerManager.heal(1)
			heal_timer = 0.0  # Reset the timer



func _on_body_entered(body: Node2D) -> void:
	print("someone here")
	player_present = true


func _on_body_exited(body: Node2D) -> void:
	player_present = false
