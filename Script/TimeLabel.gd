extends Label

var time = 0
var time_on = false


func _process(delta):
	
	time += delta
	
	var mils = fmod(time, 1) * 100
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	var hrs = fmod(fmod(time, 3600*24) / 3600, 24)

	var time_passed = "%02d:%02d:%02d:%02d" % [hrs,mins,secs,mils]
	text = time_passed
