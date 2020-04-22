extends CanvasLayer

var points = 0

func count_score():
	print("count_score()")
	points += 1
	$score.text = str(points)
