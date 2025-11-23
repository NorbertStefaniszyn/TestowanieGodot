# SimpleTest.gd
extends Node

func _ready() -> void:
	print("--- ROZPOCZYNAM TESTY ---")
	run_test_damage()
	run_test_death()
	print("--- KONIEC TESTÓW ---")

# Helper do prostego raportowania błędów
func assert_eq(actual, expected, test_name: String) -> void:
	if actual == expected:
		print("✅ [PASS] ", test_name)
	else:
		printerr("❌ [FAIL] ", test_name, " | Oczekiwano: ", expected, ", Otrzymano: ", actual)

# TEST 1: Czy postać poprawnie traci życie?
func run_test_damage() -> void:
	# Arrange (Przygotowanie)
	var player = Player.new()
	
	# Act (Działanie)
	player.take_damage(30)
	
	# Assert (Sprawdzenie)
	assert_eq(player.current_health, 70, "Test obrażeń (100 - 30 = 70)")
	
	player.free() # Sprzątanie pamięci

# TEST 2: Czy postać umiera, gdy życie spadnie do 0?
func run_test_death() -> void:
	# Arrange
	var player = Player.new()
	
	# Act
	player.take_damage(150) # Uderzamy mocniej niż ma życia
	
	# Assert
	assert_eq(player.current_health, 0, "HP nie spada poniżej zera")
	assert_eq(player.is_dead, true, "Flaga śmierci jest ustawiona")
	
	player.free()
