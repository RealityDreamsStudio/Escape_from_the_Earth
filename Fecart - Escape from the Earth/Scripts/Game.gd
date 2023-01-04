extends Node2D

onready var cena = get_tree().get_current_scene()

# Referências dos nodes
var alien
var timer
var label

# Atributos do jogo
var pontos = 0
var estado = 1
 
const JOGANDO = 1
const PERDENDO = 2

func _ready():
	# Obtem o node inicial o jogo
	alien = get_node("Alien")
	timer = get_node("Timer")
	label = get_node("Control/Label")

func kill():
	alien.apply_impulse(Vector2(0,0), Vector2(-1000,0))
	get_node("AnimationPlayer").stop()
	estado = PERDENDO
	timer.start()

func _on_Timer_timeout():
	get_tree().reload_current_scene()
	print("fim")

func pontuar():
	pontos += 1
	label.set_text(str(pontos))
	print(pontos)

func _on_Area2D_body_entered(body):
	if body.get_name() == "Alien" || body.get_name() == "Limite":
		cena.kill()
	
