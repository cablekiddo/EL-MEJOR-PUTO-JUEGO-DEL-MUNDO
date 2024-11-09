extends KinematicBody2D

var gravity = 30 # gravedad
var velocity = Vector2() # velocidad

var jumpSpeed = 600 # velocidad de salto
export var moveSpeed = 200 # velocidad de movimiento
 
var acc = 50 # aceleracion
var fricc = 50 # friccion

onready var rayM = get_node("rayM") #raycast Middle
onready var rayL = get_node("rayL") # raycast Left BTW hi to the people that are watching the stream c:
onready var rayR = get_node("rayR") # rayCast Right
# erberherhwsg
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	if !isOnGround():
		velocity.y += gravity
	else:
		velocity.y -= 0
	velocity = move_and_slide(velocity, Vector2.UP)
	
func isOnGround():
	if rayM.is_colliding() or rayL.is_colliding() or rayR.is_colliding():
		return true
	else:
		return false
