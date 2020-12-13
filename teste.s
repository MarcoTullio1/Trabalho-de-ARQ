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
		
# essa parte serve para fazer uma soma de inteiros:
number1: .word 5
number2: .word 10

.text
# qualquer outra inrtucao
 main:

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


jr $ra

