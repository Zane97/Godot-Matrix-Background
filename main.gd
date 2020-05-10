extends CanvasLayer

"""
Create a Matrix style background.
All posible letters to choose from is stored in the global_varibles.gd sccript
under the constant SYMBOLS.

spawn_time:
	Time it takes before a new instance of a trail will be spawned

letter_color:
	The initial color of the letter

fall_speed:
	How fast will the trail fall

trail_length:
	How many letters should apear behind the initial letter

trail_seperation:
	The distance in pixels between each letter in the same trail

color_fade:
	The amount of fade each subsequent letter will recive to their color

rand_change_time:
	How long it should take before the letter changes after spawn. 
	if smaller than 0 it wont change at all.
"""


export(float) var spawn_time = 0.02
export(Color, RGB) var letter_color = Color(0.0, 1.0, 0.0)
export(float) var fall_speed = 20.0
export(int) var trail_length = 5
export(float) var trail_seperation = 50.0
export(float, -1, 1) var color_fade = 0.0
export(float) var rand_change_time = -1.0

var screen_size: Vector2


func _ready():
	randomize()
	# Get the screen size
	screen_size = get_viewport().size
	
	# Hide mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _input(event):
	# Quit program
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _process(_delta):
	
	# Spawn a letter on the top of the screen every spawn_time
	if $spawn_timer.is_stopped():
		$spawn_timer.start(spawn_time)
		var letter = load(GlobalVaribles.LETTER_PATH).instance()
		add_child(letter)
		# Randomize the symbol of the letter
		letter.text = GlobalVaribles.SYMBOLS[randi() % GlobalVaribles.SYMBOLS.length()]
		# Randomize the x_location of the letter
		letter.rect_position.x = randf() * screen_size.x
		letter.rect_position.y = 0.0
		letter.init(
			letter_color, 
			fall_speed, 
			trail_length, 
			trail_seperation, 
			color_fade,
			rand_change_time)
