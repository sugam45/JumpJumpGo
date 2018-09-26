extends KinematicBody2D
const ACC = 50
const UP= Vector2(0,-1)
const GRAVITY=20
const SPEED =200
const JUMP = -550
var motion= Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACC, SPEED)
		$Sprite.flip_h=false
		$Sprite.play("run")
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACC, -SPEED)
		$Sprite.flip_h= true
		$Sprite.play("run")
	
	else:
		motion.x =0
		$Sprite.play("idle")
		friction = true
		motion.x = lerp(motion.x, 0 , 0.2)
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y=JUMP
		if friction == true:
			motion.x = lerp(motion.x, 0 , 0.2)
	else:
		if motion.y<-80:
			$Sprite.play("jump")
		elif motion.y>80:
			$Sprite.play("fall")
		elif motion.y<80 && motion.y>80:
			$Sprite.play("jump2")
		if friction == true:
			motion.x = lerp(motion.x, 0 , 0.05)
	
	motion = move_and_slide(motion, UP)
	pass