extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Global.canEnter:
		position.x += 280 * delta
	pass

func _on_Area2D_body_entered(body):
	if body.name == "KinematicBody2D":
		get_tree().change_scene("res://over.tscn")
	pass # Replace with function body.
