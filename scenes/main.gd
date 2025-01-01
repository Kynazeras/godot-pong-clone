extends Node2D

@export var ball_scene: PackedScene

@onready var p1_goal = %PlayerOneGoal
@onready var p2_goal = %PlayerTwoGoal

var current_ball = null

# Called when the node enters the scene tree for the first time.
func _ready():
	set_ball()


func set_ball():
	if(current_ball == null):
		var ball_instance = ball_scene.instantiate()
		add_child(ball_instance)

		ball_instance.global_position = Vector2(
			get_viewport().size.x / 2,
			get_viewport().size.y / 2
		)

		current_ball = ball_instance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_ball()


func _on_player_one_goal_body_entered(_body:Node2D):
	Globals.emit_player_scored('p2')
	current_ball.queue_free()
	current_ball = null


func _on_player_two_goal_body_entered(_body:Node2D):
	Globals.emit_player_scored('p1')
	current_ball.queue_free()
	current_ball = null
