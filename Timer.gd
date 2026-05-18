extends Label

@onready var timer = $Timer
@onready var label = $"."
var total_time_in_secs : int = 0

func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	label.text = format_time(total_time_in_secs)

func format_time(secs: int) -> String:
	var m := int(secs / 60.0)
	var s := secs - (m * 60.0)
	return "%02d:%02d" % [m, s]
