extends Node

# Time to leave snackbar up if none specified
const default_wait = 5

# Theme color options
const themes = {
	"default":[Color("#bababa"),Color("#000000")],
	"error":[Color("#eb4034"),Color("#ffffff")],
	"success":[Color("#2d964a"),Color("#ffffff")],
	"warning":[Color("#fcba03"),Color("#000000")],
	"notice":[Color("#4287f5"),Color("#ffffff")]
}

# The default theme for generic function
const default_theme = themes["default"]

# Display a snackbar using one of the theme options
func show_snackbar(text, time=0, theme="default"):
	show_custom_snackbar(text, time, themes[theme])

# Display a snackbar using specified theme colors
func show_custom_snackbar(text, time=0, theme=default_theme):
	if time == 0:
		time = default_wait
	print("Snackbar: ", text)
	
	# Create label style
	var style = StyleBoxFlat.new()
	style.set_expand_margin_all(5)
	style.set_corner_radius_all(5)
	style.content_margin_bottom = 5
	style.expand_margin_bottom = 0
	style.set_bg_color(theme[0])
	
	# Create label
	var label = Label.new()
	label.modulate = Color(1, 1, 1, 0)
	get_tree().get_root().add_child(label)
	
	label.set('custom_colors/font_color', theme[1])
	label.grow_horizontal = label.GROW_DIRECTION_BOTH
	label.grow_vertical = label.GROW_DIRECTION_BEGIN
	label.text = text
	label.set('custom_styles/normal', style)
	label.anchor_bottom = 1
	label.anchor_left = 0.5
	label.anchor_right = 0.5
	label.anchor_top = 1
	label.margin_bottom = -5
	label.align = Label.ALIGN_CENTER
	
	# Fade in
	var tween = Tween.new()
	label.add_child(tween)
	tween.interpolate_property(label, "modulate", 
	  Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.5, 
	  Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	
	# Wait for timeout
	yield(get_tree().create_timer(time),"timeout")
	
	# Fade out
	tween.interpolate_property(label, "modulate", 
	  Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.5, 
	  Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	label.queue_free()
