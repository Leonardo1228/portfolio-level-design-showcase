extends GeneralMovementBody2D

@export var speed_cap: float = 250
@export var turn_speed: float = 2.5

var speed_modifier: float = 0

func _physics_process(delta: float) -> void:
	super(delta)
	
	update_dir()
	
	speed.x = move_toward(speed.x, speed_cap * dir, abs(turn_speed * dir) * delta * 50)
	
	if is_on_wall():
		speed.x = 225 * get_wall_normal().x
		move_and_slide()
