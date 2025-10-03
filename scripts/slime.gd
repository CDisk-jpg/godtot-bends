extends Node2D
const speed = 10
var direction =1
@onready var ray_cast_rd: RayCast2D = $RayCastRD
@onready var ray_cast_ld: RayCast2D = $RayCastLD
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_rd.is_colliding()==false:
		direction=-1
		animated_sprite_2d.flip_h=true
	if ray_cast_ld.is_colliding()==false:
		direction=1
		animated_sprite_2d.flip_h=false

	position.x += direction*speed*delta
	

	#pass
