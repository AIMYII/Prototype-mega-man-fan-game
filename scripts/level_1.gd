extends Node2D

signal Visor_on

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_table_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$Table/Visors/Visor02.hide()
	emit_signal("Visor_on")
