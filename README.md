# Godot-Matrix-Background
A simple implementation of the matrix movie background.


All posible letters to choose from is stored in the global_varibles.gd sccript
under the constant SYMBOLS.

spawn_time:
	Time it takes before a new instance of a trail will be spawned.

letter_color:
	The initial color of the letter.

fall_speed:
	How fast will the trail fall.

trail_length:
	How many letters should apear behind the initial letter.

trail_seperation:
	The distance in pixels between each letter in the same trail.

color_fade:
	The amount of fade each subsequent letter will recive to their color.
  Each color chanel(rgb) is stored as a float value between 0 and 1, fade will subtract the amount of color fade from each color channel.

rand_change_time:
	How long it should take before the letter changes after spawn. 
	if smaller than 0 it wont change at all.
