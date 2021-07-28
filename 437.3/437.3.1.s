.data
    array: .word 84 21 38 10 85
    message1 : .asciiz "The Maximum Number in the array is : "
    newline : .asciiz "\n"
    max : .word 0
    size : .word 5

.text
    main:
        la $a1, array
        lw $t0, size
        lw $t1, 0($a1)
        addi $t0,$t0,-1
        addi $a1,$a1,4

        loop:
            lw $t4,0($a1)
            addi $a1,$a1,4
            addi $t0,$t0,-1
            blt $t4,$t1,loop
            move $t1,$t4
            bnez $t0,loop

        li $v0,4
        la $a0,message1
        syscall

        li $v0,1
        move $a0,$t1
        syscall



        li $v0,10
        syscall


