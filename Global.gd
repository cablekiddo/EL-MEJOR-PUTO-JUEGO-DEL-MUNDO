extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var progressValue = 2.5
var canEnter = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if progressValue < 0.01:
		get_tree().change_scene("res://over.tscn")
	pass
