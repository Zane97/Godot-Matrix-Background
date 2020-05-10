extends Label

var fall_speed

func _on_change_timer_timeout():
	self.text = GlobalVaribles.SYMBOLS[randi() % GlobalVaribles.SYMBOLS.length()]


func _process(_delta):
	self.rect_position.y += fall_speed
	if self.rect_position.y > get_viewport().size.y:
		queue_free()


func init(
	letter_color: Color,
	speed: float, 
	trailing_letters: int = 0, 
	trailing_distance: float = 50.0,
	color_fade: float = 0.0,
	rand_time: float = -1.0
	):
	
	# Set varibles
	fall_speed = speed
	self.modulate = letter_color
	
	# Start timer
	if rand_time > 0:
		$change_timer.start(rand_time)
	
	# Apply color fade after self color change, will affect child
	letter_color.r = letter_color.r - color_fade
	letter_color.g = letter_color.g - color_fade
	letter_color.b = letter_color.b - color_fade
	
	# Spawn another letter
	if trailing_letters > 0:
		var letter = load(GlobalVaribles.LETTER_PATH).instance()
		# Add child to parent because falling happens in each letter
		get_parent().add_child(letter)
		letter.text = self.text
		letter.rect_position.x = self.rect_position.x
		letter.rect_position.y = self.rect_position.y - trailing_distance
		
		letter.init(
			letter_color, 
			speed, 
			trailing_letters - 1, 
			trailing_distance,
			color_fade,
			rand_time)
