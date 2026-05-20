extends RigidBody2D

var new_word : String
var characters = "abcdefghijklmnopqrstuvwxyz1234567890"
var Health := 100

@export var input : LineEdit
@export var failedscreen : Node2D

func _ready():
	start_game()

func start_game() -> void:
	while true:
		new_word = generate_word(characters, randi_range(1, 10))
		$Label.text = new_word
		input.text = ""
		await wait_for_correct_input()
		
		if input.text == new_word and Health < 100:
			print("yay!")
			Global.Kill = true;
			Health += 3;
			$ProgressBar.value = Health

func generate_word(chars, length):
	var word = ""
	var n_char = chars.length()

	for i in range(length):
		word += chars[randi() % n_char]

	return word

func wait_for_correct_input() -> void:
	while input.text != new_word:
		await get_tree().process_frame


func _on_body_entered(body: Node) -> void:
	print ("OW")
	
	if Health > 0:
		Health -= 2
		$ProgressBar.value = Health
		
	if Health <= 0:
		Health = 0
		$ProgressBar.value = 0
		failedscreen.visible = true
		queue_free()
		Engine.time_scale = 0
		
