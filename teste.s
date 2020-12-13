# aqui coloca as variaveis

.data
# isso e apenas um espaco entre as linhas de codigo
 mySpace: .asciiz "\n" 

# variaveis aqui
 myMessage: .asciiz "hello world \n" 
 myCaracter: .byte 'm'
 myAge: .word 18   # serve para  inteiro
 myFloat:  .float 3.14
 myDouble: .double 7.202 # o double sai sem os zeros  do float
 zeroDouble: .double 0.0
 
# Pegando o float que o usuario digitar

floatMessage: .asciiz "Digite o numero de PI: "
zeroASFlotat: .float 0.0

 # Pegando o inteiro que o usuario digitar

prompt: .asciiz "\nDigite sua idade: "
suaIdade: .asciiz "\nSua idade e: "

		
# essa parte serve para fazer uma soma de inteiros:
number1: .word 5
number2: .word 10


# essa parte serve para fazer uma subtracao de inteiros:
numberSub1: .word 20
numberSub2: .word 8



.text
# qualquer outra inrtucao
 main:
 
	lwc1 $f4,zeroASFlotat # faco f4 = 0.0
	li $v0,4
	la $a0, floatMessage
	syscall

	# ler o que usuario digitar

	li $v0, 6 # 6 e para float
	syscall

	# mostrar o valor para o usuario

	li $v0 , 2
	add.s $f12, $f0,$f4 # fazemos essa soma para que o resultado fique em f12 para ser somado
	syscall

	li $v0, 4 
	la $a0, mySpace 
	syscall 

	# printa um hello world

	li $v0, 4 # Mostra que eu quero printar uma mensagem na tela
	la $a0, myMessage # qual a mesnagem que eu quero printar
	syscall # printar agora essa mensagem

	li $v0, 4 
	la $a0, mySpace 
	syscall 


 	# printa um Caracter
	 li $v0 ,4
	 la $a0 ,myCaracter
	 syscall

	li $v0, 4 
	la $a0, mySpace 
	syscall 


	# printa um numero inteiro
	li $v0, 1 # para printar inteiro tem que ser 1
	lw $a0, myAge # lw = load word
	syscall

	li $v0, 4 
	la $a0, mySpace 
	syscall 

	# printar float
	li   $v0, 2 # usamos 2 para float
	lwc1 $f12, myFloat  # tem que ser sempre 12
	syscall

	li $v0, 4 
	la $a0, mySpace 
	syscall 

	# printar Doubles
	ldc1 $f2, myDouble  # usamos para double
	ldc1 $f0,zeroDouble # coloca o zero double em f0

	li $v0, 4 
	la $a0, mySpace 
	syscall 
	
	li $v0,3 # usamos para printar double
	add.d  $f12, $f2 , $f0 # vai somar f0 e f2
	syscall
	
	li $v0, 4 
	la $a0, mySpace 
	syscall 

	# soma de inteiros

	lw $t0, number1($zero) # pega o number1 da memoria e atribui ao $t0
	lw $t1, number2($zero)

	add $t2, $t0,$t1 # t2 = t0 + t1

	li $v0, 1
	add $a0,$zero, $t2
	syscall	

	li $v0, 4 
	la $a0, mySpace 
	syscall 

	# somsyba de inteiros
	lw $s0, numberSub1 # s0 = 20
	lw $s1, numberSub2 # s0 = 8

	sub $t0,$s0,$s1 # t0 - 20 -8

	li $v0, 1 
	move $a0,$t0 # isso move o valor de t0 para a0 (ou seja $a0 = $t0)
	syscall

	# essa parte serve para pegar inteiros que o usuario digitar
	
	# Vamos pedir para o usuario digitar a idade

	li $v0, 4
	la $a0, prompt
	syscall
	
	# pegar a ididade do usuario 

	li $v0,5 # 5 = pegar um inteiro do usuario e que vai ser armazenado em v0
	syscall
	
   # Armazenar os resultados em t0

	move $t0,$v0 # $t0 = $v0

	# mostrar mensagem

	li $v0, 4
	la $a0, suaIdade
	syscall

	# ptintar a mensagem
	li $v0, 1
	move $a0,$t0 
	syscall

jr $ra

