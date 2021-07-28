.data
    array:.word 8 2 6
          .word 4 2 9
          .word 7 1 3

    message1:.asciiz "The Sum of the diagonals in the matrix is :  "
    size: .word 3

.text
    main:
        la $a1, array
        lw $t1, size

        li $v0,4
        la $a0,message1
        syscall

        jal sumofdiagonal	
        move $a0, $v0		
        li $v0, 1
        syscall

        li $v0, 10
        syscall

    sumofdiagonal:
        li $v0, 0
        li $t0, 0

        loop:
            mul $t3, $t0, $t1
            add $t3, $t3, $t0
            mul $t3, $t3, $t1
            add $t3, $a1, $t3

            lw $t2, ($t3)
            add $v0, $v0, $t2
            addi $t0, $t0, 1
            blt $t0, $t1, loop
     
        jr $ra			
      
         		 
        