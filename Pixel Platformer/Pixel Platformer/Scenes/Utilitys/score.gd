extends RichTextLabel

@onready var player = get_node("/root/Player")
var Print = true

func _ready():
	if Print == true:
		self.text = str("Score: ", player.score)
		print(player.score)
