extends Node
class_name ScoreManager

signal score_updated

var p1_score = 0
var p2_score = 0

const MAX_SCORE = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.player_scored.connect(increase_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func increase_score(player: String):
	if(player == 'p1'):
		p1_score +=1
	else:
		p2_score +=1
	score_updated.emit()