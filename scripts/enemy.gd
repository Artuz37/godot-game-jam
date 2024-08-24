extends Area2D

@onready var player_manager = get_node("/root/PlayerManager")
var player_present = false


func _process(delta: float) -> void:
	if player_present:
		player_manager.deal_damage(1)


func _on_body_entered(body: Node2D) -> void:
	print("aya")
	player_present = true


func _on_body_exited(body: Node2D) -> void:
	print("pa")
	player_present = false
	
