extends KinematicBody2D

var gravity = 55 # gravedad
var velocity = Vector2() # velocidad

var jumpSpeed = 650 # velocidad de salto
export var moveSpeed = 200 # velocidad de movimiento
 
var acc = 50 # aceleracion
var fricc = 50 # friccion

onready var rayM = get_node("rayM") #raycast Middle
onready var rayL = get_node("rayL") # raycast Left BTW hi to the people that are watching the stream c:
onready var rayR = get_node("rayR") # rayCast Right
var jumpCounter = 0
var canDouble
var wallSpeed = 150
var speedWall = 60
onready var animation = $AnimatedSprite
# erberherhwsg
func _ready():
	animation.play("idle")
func _physics_process(delta):
	print(canDouble)
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		animation.play("walk")
	else:animation.play("idle")
	if Input.is_action_pressed("run"):
		animation.play("run")
	else:animation.play("idle")
	if !isOnGround():
		velocity.y += gravity
	else:
		velocity.y -= 0
	velocity = move_and_slide(velocity, Vector2.UP)
	if !Global.canEnter:
		if isOnGround():
			if Input.is_action_pressed("ui_jump"):
				velocity.y = -jumpSpeed
				canDouble = false
				$Pap.play()
				animation.play("jump")
		if Input.is_action_pressed("ui_left") and velocity.x > -moveSpeed:
			velocity.x -= acc
			animation.flip_h = true
		if Input.is_action_pressed("ui_right") and velocity.x < moveSpeed:
			velocity.x += acc
			animation.flip_h = false
		if !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right"):
			velocity.x -= sign(velocity.x) * fricc
	run()
	
	
	if position.y > 900:
		get_tree().change_scene("res://over.tscn")
	
func isOnGround():
	if rayM.is_colliding() or rayL.is_colliding() or rayR.is_colliding():
		return true
	else:
		return false
func run():
	if Input.is_action_pressed("run"):
		moveSpeed = 380
	else:
		moveSpeed = 200
