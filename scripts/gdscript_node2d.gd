extends Node2D

export var weight = 100

var nickname = "jj" setget set_nickname, get_nickname

signal my_signal
signal my_signal2(num1,str1)

func _ready():
#	variables()
#	operators()
#	strings()
#	flow()
#	loop()
#	var result = function_sum(2,3)
#	print(result)
#	var result2 = function_sum(2)
#	print(result2)
#	use_my_class()
#	my_weight()
#	test_setget()
#	test_signal()
	test_yield()

func variables():
	var number1 = 1
	var number2 = 3.14
	var text = "olá"
	var array1 = [1,2,3]
	var array2 = ["a","b"]
	var array3 = [1,"a"]
	print(array3)
	print(array3[1])
	var array4 = [array1,array2]
	print(array4)
	print(array4[1][1])
	var dictionary = {"chave":"valor",2:3,"vector2":Vector2(100,100)}
	print(dictionary)
	print(dictionary["chave"])
	print(dictionary.chave)
	print(dictionary[2]) # procure não usar chave como numero em dictionaries
	var vetor2d = Vector2(100,100)
	var vetor3d = Vector3(100,100,100)
	var color = Color(1,1,1,1)

func operators():
	print("5+2 :",5+2)
	print("5-2 :",5-2)
	print("5*2 :",5*2)
	print("5/2 :",5/2)
	print("5.0/2.0 :",5.0/2.0)
	print("5%2 :",5%2)

func strings():
	var text = "a"
	print(text)
	var text_with_quoted = "\"a\""
	print(text_with_quoted)
	var text_skips_line = "a\nb"
	print(text_skips_line)
	var text_concatenar = str("a","b")
	print(text_concatenar)

func flow():
	var a = 11
	if a > 10:
		print("maior que 10")
	else:
		print("menor que 10")
		
	var b = 4
	if b > 10:
		print("maior que 10")
	elif b < 5:
		print("menor que 10. E menor que 5")
	else:
		print("menor que 10")

func loop():
	for a in range(2,7):
		print(a)
	
	var array = ["a","b","c"]
	for letter in array:
		print(letter)
	
	var dic = {"nome":"joao","peso":100}
	for key in dic:
		print(key)
		print(dic[key])
	
	var count = 0
	while count < 7:
		print(count)
		count += 1

func function_sum(num1,num2 = 1):
	var calc = num1+num2
	return calc

func use_my_class():
	var my_obj = load("res://scripts/new_script_for_new_class.gd").MyClass.new()
	my_obj.my_print()

func my_weight():
	print(weight)

func set_nickname(value):
	nickname = value
	
func get_nickname():
	return nickname

func test_setget():
	print(nickname)
	set_nickname("jk")
	print(get_nickname())

func test_signal():
	connect("my_signal",self,"on_my_signal")
	emit_signal("my_signal")
	connect("my_signal2",self,"on_my_signal2")
	emit_signal("my_signal2",1,"a")

func on_my_signal():
	print("ouvi my_signal")

func on_my_signal2(any_num,any_str):
	print("ouvi my_signal2",any_num,any_str)

func test_yield():
	print("Hello")
	yield(get_tree().create_timer(3),"timeout")
	print("Word")
