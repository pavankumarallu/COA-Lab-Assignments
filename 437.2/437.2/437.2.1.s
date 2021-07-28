.data
    array: .word 5 9 7 10 25
    message1 : .asciiz "The index in the array : "
    message2 : .asciiz "Enter the number to search in the Array : "
    newline : .asciiz "\n"
   	index : .word 0


.text
    main:
        li $t1,0
        lw $t3,max
        la $a1,array
        

       
        loop1:
        	lw $t4,($a1)
            addi $a1,$a1,4
            addi $t1,$t1,-1
        	blt $t4,$t3,loop1
        	move $t3,$t4
        	bnez $t1,loop1

        li $v0,4
        la $a0,message1
        syscall

        li $v0,1
        move $a0,$t3
        syscall

        li $v0,10
        syscall
