extends CanvasLayer
class_name GameUI

@export var score_manager: ScoreManager

@onready var p1_score_label: Label = %PlayerOneScore
@onready var p2_score_label: Label = %PlayerTwoScore

signal score_updated

# Called when the node enters the scene tree for the first time.
func _ready():
	score_manager.score_updated.connect(update_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_score():
	p1_score_label.text = str(score_manager.p1_score)
	p2_score_label.text = str(score_manager.p2_score)
