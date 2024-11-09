extends "res://enemigogrr.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = 1
onready var ray1 = get_node("raytracing1")
onready var ray2 = get_node("raytracing2")
onready var ray3 = get_node("rayL2")
onready var ray4 = get_node("rayL3")
onready var ray5 = get_node("rayL4")
onready var health = get_node("TextureProgress")
# Called when the node enters the scene tree for the first time.
func _ready():
	moveSpeed = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = moveSpeed * direction
	if ray1.is_colliding():
		direction = 1
	if ray2.is_colliding():
		direction = -1
	if ray3.is_colliding() or ray4.is_colliding() or ray5.is_colliding():
		queue_free()
	pass


func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D":
		Global.progressValue -= 0.5
	pass # Replace with function body.
