.data



mensagem: 	.asciiz "Digite o primeiro numero: "
mensagem2: 	.asciiz "Digite o segundo numero: "
saida: 	    .asciiz "Digite a saida desejada: "
exibir: 	    .asciiz "\n---------------------------------\n"
erro: 	    .asciiz "Erro: "
peso1: 	    .asciiz "peso1: "
peso2: 	    .asciiz "peso2: "
mySpace:    .asciiz "\n"

p1: 	.float 0.00000000
p2: 	.float 0.80000000
taxa: 	.float 0.05
zeroASFlotat: .float 0.0


# f0 = 0.0
# f1 = primeiro  peso (p1)
# f2 = segundo  peso (p2)
# f3 = taxa
# f4 = primeiro numero a ser somado
# f5 = segundo numero a ser somado
# f6 = saida desejada
# f7 = peso total
# f8 = erro
# f9 = variavel temporaria par calculo de peso


.text
    

main:	
    # zera o f8 
        lwc1 $f8,zeroASFlotat       
    # END

     # atribuido pesos a f1 e f2 e taxa de taxa a f3
	    lwc1 $f1, p1 
	    lwc1 $f2, p2 
	    lwc1 $f3, taxa 
    # END

 Calculo: 
    # zera o f0 
        lwc1 $f0,zeroASFlotat       
    # END
        
    # aqui pega o primeiro numero

        # printa uma mensagem
        li $v0, 4
		la $a0, mensagem
		syscall
        # END

         # Le o que o usuario digitou
        li $v0,6
        syscall
        # END   

        # atribui a f4 o valor que o usuario digitou
        add.s $f4,$f18,$f0
        # END
       

    # END

    # aqui pega o segundo numero

        # printa uma mensagem
        li $v0, 4
		la $a0, mensagem2
		syscall
        # END

         # Le o que o usuario digitou
        li $v0,6
        syscall
        # END   

        # atribui a f5 o valor que o usuario digitou
        add.s $f5,$f18,$f0
    # END
       

    # aqui pega o valor correto

        # printa uma mensagem
        li $v0, 4
		la $a0, saida
		syscall
        # END

         # Le o que o usuario digitou
            li $v0, 6
            syscall
        # END   

        # atribui o que o usuario digitou ao f6
        add.s $f6,$f18,$f0       
    # END

    # apensa um espaco no texto
        li $v0, 4 
	    la $a0, mySpace 
	    syscall 
    # END

     # onde a magica acontece(os calculos melhor dizendo)



        # mutiplica os pesos pelos numeros digitados
        mul.s $f1,$f1,$f4
        mul.s $f2,$f2,$f5
        # END

        # Calcuo do peso total
        add.s $f7,$f1,$f2,
        # END

        # Calcuo do erro
        sub.s $f8,$f6,$f7
        # END

        # Calculo de novos pesos

            # calculo de peso1
                mul.s $f9,$f8,$f3
                mul.s $f9,$f9,$f4
                add.s $f1,$f1,$f9
             # END

             # calculo de peso2
                mul.s $f9,$f8,$f3
                mul.s $f9,$f9,$f5
                add.s $f2,$f2,$f9
             # END
        # END

   
    # zera o f0 e o f18
        lwc1 $f0,zeroASFlotat       
    # END

    # Erro
	    li $v0,4
	    la $a0, exibir
	    syscall

        li $v0,4
	    la $a0, erro
	    syscall

	    # ptintar o numero
	    li $v0 , 2
        add.s $f12, $f0, $f8,
	    syscall
    # END

  # apensa um espaco no texto
        li $v0, 4 
	    la $a0, mySpace 
	    syscall 
    # END

     # zera o f0 e o f18
        lwc1 $f0,zeroASFlotat       
    # END

    # peso 1
        li $v0,4
	    la $a0, peso1
	    syscall

	    # ptintar o numero
	    li $v0 , 2
        add.s $f12, $f0, $f1,
	    syscall
    # END

     # zera o f0 e o f18
        lwc1 $f0,zeroASFlotat       
    # END

  # apensa um espaco no texto
        li $v0, 4 
	    la $a0, mySpace 
	    syscall 
    # END

    # peso 2
        li $v0,4
	    la $a0, peso2
	    syscall

	    # ptintar o numero
	    li $v0 , 2
        add.s $f12, $f0, $f2,
	    syscall
    # END

     # zera o f0 e o f18
        lwc1 $f0,zeroASFlotat       
    # END

     # apensa um espaco no texto
        li $v0, 4 
	    la $a0, mySpace 
	    syscall 
    # END
     # apensa um espaco no texto
        li $v0, 4 
	    la $a0, mySpace 
	    syscall 
    # END
        
     jr Calculo



        jr $ra