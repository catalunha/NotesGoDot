extends Node2D

# aprendendo a usar export para editor
var v00 = Vector2(0,0)
var vCenter = Vector2(500,500)
var x = 0
var y = 0

func _ready():
	print("Iniciando")
	
func _process(delta):
	var update = false
	if Input.is_action_just_pressed("ui_right"):
		x += 10
		update = true

	if Input.is_action_just_pressed("ui_left"):
		x -= 10
		update = true

	if Input.is_action_just_pressed("ui_up"):
		y -= 10
		update = true

	if Input.is_action_just_pressed("ui_down"):
		y += 10
		update = true
		
	if update:
		update() 

#	if Input.is_action_pressed("ui_select"):

func _draw():
#	vectorFull()
#	vectorEmpty()
#	vectorParts()
#	vectorAdd()
#	vectorScalar()
#	vectorMoviment()
#	vectorTarget()
#	vectorReflect()
	vectorAngle()
	
# Criando um vetor (x, x) na inicialização.
func vectorFull():
	var v1 = Vector2(x, y)
	print("v1: ",v1)
	draw_vector(v00, v1, Color.blue)

# Criando um vetor (0,0) e associando x e y independentemente.
func vectorEmpty():
	var v2 = Vector2()
	v2.x = x
	v2.y = y
	print("v2: ",v2)
	draw_vector(v00, v2, Color.green)

func vectorParts():
	var v3 = Vector2(x,y)
	print("v3: ",v3)
	print("v3.length: ",v3.length())
	print("v3.angle (radianos): ",v3.angle())
	print("v3.angle (graus): ",rad2deg(v3.angle()))
	print("v3.normalized: ",v3.normalized())
	draw_vector(vCenter, vCenter+v3, Color.red)
	
# Adicionando um vetor a outro
func vectorAdd():
	print("+++ vectorAdd +++")
	var v1 = Vector2(x, y)
	print("v1 (blue): ",v1)
	draw_vector(vCenter, vCenter+v1, Color.blue)	
	var v2 = Vector2(300, 100)
	print("v2 (green): ",v2)
	draw_vector(vCenter, vCenter+v2, Color.green)	
	var v1plusv2 = v1+v2
	print("v1 + v2 (red): ",v1plusv2)
	draw_vector(vCenter+v1,vCenter+v1plusv2, Color.aqua)
	draw_vector(vCenter+v2,vCenter+v1plusv2, Color.darkcyan)
	draw_vector(vCenter,vCenter+v1plusv2, Color.red)

func vectorScalar():
	print("+++ vectorScalar +++")
	var v1 = Vector2(x, y)
	print("v1 (blue):",v1)
	var scalar = 2
	print("n: ",scalar)
	var v1scalar = v1 * scalar
	print("v1 * n (red): ",v1scalar)
	draw_vector(v00,v1scalar, Color.red)
	draw_vector(v00,v1, Color.blue)

func vectorMoviment():
	var position = Vector2(100, 300)
	print("position: ",position)
	var velocity = Vector2(200, 100)
	print("velocity: ",velocity)
	draw_vector(v00,position, Color.blue)
	var novaposition = position + velocity
	print("novaposition: ",novaposition)
	draw_vector(position,novaposition, Color.red)
	# Pegar um objeto filho deste.
	# use get_node("YellowBallSprite") ou $YellowBallSprite
	# que resulta na mesma coisa
	$YellowBallSprite.visible = true
	$YellowBallSprite.position = position
	var timer = get_tree().create_timer(4)
	yield(timer,"timeout")
	$YellowBallSprite.position = novaposition

func vectorTarget():
	print("+++ vectorTarget +++")
	var tank = Vector2(x, y)
	print("tank (blue): ",tank)
	draw_vector(v00,tank, Color.blue)
	var robot = Vector2(200, 100)
	print("robot (green): ",robot)
	draw_vector(v00,robot, Color.green)
	var tank2robot = tank-robot
	print("tank2robot (red): ",tank2robot)
	draw_vector(tank,robot, Color.red)
	var robot2tank = robot-tank
	print("robot2tank: ",robot2tank)

func vectorReflect():
	print("+++ vectorReflect +++")
	var vBlue = Vector2(x,y)
	print("vBlue:  ",vBlue)
	draw_vector(v00,v00+vBlue,Color.blue)
	var vRed = vBlue
	vRed.x = -vRed.x
#	vRed.y = -vRed.y
	print("vRed:  ",vRed)
	draw_vector(v00+vBlue,v00+vBlue+vRed,Color.red)

func vectorAngle():
	print("+++ vectorAngle +++")
	var vBlue = Vector2(x,y)
	print("vBlue:  ",vBlue)
	draw_vector(v00,v00+vBlue,Color.blue)
	print("vBlue.angle (radianos)",vBlue.angle())
	print("vBlue.angle (degres)",rad2deg(vBlue.angle()))

func draw_vector(start, end, color):
	draw_line(start, end, color, 3)
	arrow(end,start.direction_to(end),10,color)

func arrow(pos, dir, size, color):
#	print("pos: ",pos," dir: ",dir," size: ",size)
	pos = pos - dir * size
	var a = pos + dir * size
#	print("a: ",a)
	var b = pos + dir.rotated(deg2rad(135)) * size
#	print("b: ",b)
	var c = pos + dir.rotated(deg2rad(-135)) * size
#	print("c: ",c)
	var points = PoolVector2Array([a,b,c])
	draw_polygon(points,PoolColorArray([color]))
