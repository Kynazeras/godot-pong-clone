extends RigidBody2D
class_name Ball

var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(-200, randf_range(-50,50)))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if linear_velocity.length() < 232:
		apply_central_impulse(linear_velocity.normalized() * 10)
	
	if linear_velocity.normalized().y > 0.95:
		apply_central_impulse(Vector2(-50, 0))


func _on_body_entered(body:Node):
	if(body is Paddle):
		apply_central_impulse(Vector2(250,0).rotated(randf() * 2.0 * PI))
