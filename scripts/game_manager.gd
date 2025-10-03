extends Node

var score = 0
@onready var scoreLabel: Label = $scoreLabel

func add_point():
	score+=1
	scoreLabel.text = "you collected " + str(score) + " coins"
