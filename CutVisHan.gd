extends Control

signal returnToGame()
signal cordBark()
signal mackBark()
signal amieBark()
signal curiBark()

var activeConvo
var activeLine

# First time meeting Mackenzie
var convo0 = [["Yoooo, dude! Welcome to my crib! Are you here to chillax with your girl Mackenzie? I’ve been here all by myself for way too long, and it’s getting me hella lonely. Not radical at all.", 1], ["Mackenzie? You seem…quite expressive. Are you feeling okay?", 0], ["Yeah, everything’s aight…NOT! I just keep thinking to myself: ‘Mackenzie, you’re such a cool dog. So why don’t I feel like a cool dog?’", 1], ["I’m…not sure I understand.", 0], ["I’m just vibing in here, being the wicked badass girl that I am, but like, where’s the flavour? It’s so not cool, I’m totally wiggin’ out. I need something RADICAL to get me back in the zone.", 1], ["(She’s not making sense…If I can find something to really shock her system, maybe we can figure this mess out together.)", 0]]
# Giving Mackenzie correct item (altoids)
var convo1 = [["(Okay, here goes nothing.)", 0], ["BOOYAH!", 1], ["I don’t know how you did it, Cordelia, but I’m feeling righteous again! What the heck came over me just now?", 1], ["I don’t know, Mackenzie. It seems like the whole place is going haywire.", 0], ["Well, whatever. If we were whammied, maybe the rest of the androids in here are in mad need of a chill pill as well. I’ll give you access to the archive!", 1], ["Perfect!", 0], ["But first, you gotta get a reward for un-harshing the vibe around here. Gimme a hug!", 1], ["O-oh! I mean, sure, if you don’t mind!", 0], ["There you go! Feeling better, home skillet?", 1], ["I…guess so.", 0], ["I need to go sort this mess out. I’ll…see you around, Mackenzie?", 0], ["You betcha! Now go, girl, some other poor android is probably wigging out all alone somewhere!", 1]]
# Give Mackenzie incorect item Rubber Duck
var convo2 = [["(She did say she wanted something radical and well…this duck is pretty cool.)", 0], ["Whoa, who do you have there? This little dude is THE BOMB!", 1], ["He’s WHAT? What kind of nefarious individual would hide a bomb inside a defenseless duck?", 0], ["Don’t have a cow, man. The duck is wicked cool, you get me? No need to bug out.", 1], ["Oh…Sorry about that! I mean, it is a pretty cool duck, you’re right.", 0], ["Word.", 1], ["(As cool as this duck is, giving it to Mackenzie didn’t seem to achieve anything. Maybe it’s just not radical enough to bring her back to her senses?)", 0]]

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func setup():
	clearScreen()
	$DialogTextBox.push_font_size(40)

func cleanUp():
	clearScreen()

func clearScreen():
	for n in self.get_children():
		n.visible = false

func displayConvoScene(leftChar, rightChar):
	show()
	self.clearScreen()
	$DialogBG.visible = true
	$TextBacking.visible = true
	if leftChar == 0:
		$Sprite0.visible = true
		$Nameplate0.visible = true
	if rightChar == 1:
		$Sprite1.visible = true
		$Nameplate1.visible = true
	elif rightChar == 2:
		$Sprite2.visible = true
		$Nameplate2.visible = true
	elif rightChar == 3:
		$Sprite3.visible = true
		$Nameplate3.visible = true
	$DialogTextBox.clear()
	$DialogTextBox.push_font_size(40)
	$DialogTextBox.visible = true

func displayDialog(convoID):
	activeConvo = convoID
	activeLine = 0
	$DialogTextBox.add_text(self.getActiveConvo(convoID)[0][0])
	chooseActiveTalker(self.getActiveConvo(convoID)[0][1])
	$ContinueB.visible = true

func getActiveConvo(convoID):
	match convoID:
		0:
			return convo0
		1:
			return convo1
		2:
			return convo2

func chooseActiveTalker(talkerID):
	$Nameplate0.visible = false
	$Nameplate1.visible = false
	$Nameplate2.visible = false
	$Nameplate3.visible = false
	match talkerID:
		0:
			$Nameplate0.visible = true
			cordBark.emit()
		1:
			$Nameplate1.visible = true
			mackBark.emit()
		2:
			$Nameplate2.visible = true
			amieBark.emit()
		3:
			$Nameplate3.visible = true
			curiBark.emit()

func advanceDialog():
	self.activeLine += 1
	if activeLine < self.getActiveConvo(activeConvo).size():
		$DialogTextBox.clear()
		$DialogTextBox.push_font_size(40)
		$DialogTextBox.add_text(self.getActiveConvo(activeConvo)[activeLine][0])
		chooseActiveTalker(self.getActiveConvo(activeConvo)[activeLine][1])
	else:
		cleanUp()
		returnToGame.emit()

func _on_continue_b_pressed():
	advanceDialog()
