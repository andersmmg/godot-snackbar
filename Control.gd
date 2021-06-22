extends Control

var wait_time = 2

func _ready():
	yield(get_tree().create_timer(1),"timeout")
	
	Snackbar.show_snackbar("default message", wait_time, "default")
	
	yield(get_tree().create_timer(wait_time+1),"timeout")
	
	Snackbar.show_snackbar("success message", wait_time, "success")
	
	yield(get_tree().create_timer(wait_time+1),"timeout")
	
	Snackbar.show_snackbar("error message", wait_time, "error")
	
	yield(get_tree().create_timer(wait_time+1),"timeout")
	
	Snackbar.show_snackbar("warning message", wait_time, "warning")
	
	yield(get_tree().create_timer(wait_time+1),"timeout")
	
	Snackbar.show_snackbar("notice message", wait_time, "notice")
	
	yield(get_tree().create_timer(wait_time+1),"timeout")
	
	Snackbar.show_custom_snackbar("custom message", wait_time, [Color("#b504a0"),Color("#f2ff3d")])
