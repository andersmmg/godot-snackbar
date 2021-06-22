# godot-snackbar
Simple snackbars in Godot Engine

![screenshot](screenshot1.png)

## Usage
Clone this repo, or just copy the `snackbar.gd` file to your project.

Add the `snackbar.gd` file to your autoloads and call the `show_snackbar()` function.

## Examples
```gdscript
Snackbar.show_snackbar("default message", wait_time, "default")

Snackbar.show_snackbar("success message", wait_time, "success")
	
Snackbar.show_snackbar("error message", wait_time, "error")
	
Snackbar.show_snackbar("warning message", wait_time, "warning")
	
Snackbar.show_snackbar("notice message", wait_time, "notice")
	
Snackbar.show_custom_snackbar("custom message", wait_time, [Color("#b504a0"),Color("#f2ff3d")])
```
