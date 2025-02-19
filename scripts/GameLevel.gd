extends Node3D

var coins = 0
var time_limit = 30  

@onready var coin_label = $Control/Counter  
@onready var timer_label = $Control/TimerLabel 
@onready var game_timer = $Timer 

func _ready():
	coin_label.text = str(coins)  
	update_timer(time_limit)  

	
	game_timer.wait_time = time_limit
	game_timer.one_shot = true  

func _on_coin_coin_collected():
	coins += 1
	coin_label.text = str(coins)  

	if coins == 5 and not game_timer.is_stopped():
		game_timer.start() 

func _on_timer_timeout():
	if coins < 5:
		
		get_tree().change_scene_to_file("res://assets/gameOver.tscn")
	else:
		
		get_tree().change_scene_to_file("res://assets/gameWon.tscn")

func _process(delta):
	if game_timer.time_left > 0:
		update_timer(ceil(game_timer.time_left))  

func update_timer(time_left):
	timer_label.text = "Time: " + str(time_left)  
