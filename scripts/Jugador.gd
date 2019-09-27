extends KinematicBody2D

export (int) var run_speed = 500
export (int) var jump_speed = -1000
export (int) var gravity = 2400

var velocity = Vector2()
var jumping = false

func get_input():
    velocity.x = 0
    var right = Input.is_action_pressed('right')
    var left = Input.is_action_pressed('left')
    var jump = Input.is_action_just_pressed('jump')

    if jump and is_on_floor():
        jumping = true
        velocity.y = jump_speed
    if right:
        velocity.x += run_speed
    if left:
        velocity.x -= run_speed

func _ready():
	#var jugador_vars = get_node("/root/Global")
	pass

func _physics_process(delta):
    get_input()
    velocity.y += gravity * delta
    if jumping and is_on_floor():
        jumping = false
    velocity = move_and_slide(velocity, Vector2(0, -1))