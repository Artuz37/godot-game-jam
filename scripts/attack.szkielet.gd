extends Area2D

@onready var animated_sprite_2d = $"../AnimatedSprite2D"

var player_present = false

var attack_timer: float = 0.0
var attack_speed: float = 1.0  # 1.0 seconds

func _process(delta: float) -> void:
	if player_present:
		attack_timer += delta
		if animated_sprite_2d.animation != "attack" or !animated_sprite_2d.is_playing():
			animated_sprite_2d.play("attack")
		if attack_timer >= attack_speed:
			print("atakuje")
			PlayerManager.deal_damage(2)
			attack_timer = 0.0


func _on_body_entered(body):
	print("someone here")
	player_present = true


func _on_body_exited(body):
	player_present = false
