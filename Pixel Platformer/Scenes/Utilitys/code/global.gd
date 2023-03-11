extends Node

var score = 0
var door = false

func add_coin():
	score += 1

func reset():
	score = 0

func add_diamond():
	score += 5

func key():
	door = true
