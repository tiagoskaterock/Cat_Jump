extends CanvasLayer

var points = 0

func count_score():
	points += 1
	$score.text = str(points)

func game_over():
	$score.hide()
	$game_over/animation.play("game_over")
	$game_over/last_score.text = str(points)
	$game_over/best_score.text = str(points)
	


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
