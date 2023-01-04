extends Node2D

# Referencia a cena do game
onready var cena = get_tree().get_current_scene()

export var vel = 150
export var limite = -100

func _ready():
	set_process(true)

func _process(delta):
	
	# Mover o cano
	position.x -= vel * delta
	
	# Retornar e sortear uma altura em Y
	if position.x < limite:
		position = Vector2(3700, randi()%500+100)

func _on_Area2D_body_entered(body):
	# Verifica o nome 
	if body.get_name() == "Alien":
		cena.kill()

func _on_Area2D2_body_entered(body):
	if body.get_name() == "Alien":
		cena.pontuar()

func _on_Area2D3_body_entered(body):
	if body.get_name() == "Alien":
		cena.pontuar()
