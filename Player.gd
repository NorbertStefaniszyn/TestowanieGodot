# Player.gd
class_name Player
extends Node

var max_health: int = 100
var current_health: int = 100
var is_dead: bool = false

func take_damage(amount: int) -> void:
	current_health -= amount
	
	if current_health <= 0:
		current_health = 0
		is_dead = true
