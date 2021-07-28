.data
    string1 : .asciiz "PUPPY"
    string2 : .asciiz "PUPPYii"
    note : .asciiz "If the strings are same Displays -- 1 else Displays -- 0\n"
    same : .word 1
    different : .word 0

.text
    main:
        la $t0,string1
        la $t1,string2

        li $v0,4
        la $a0,note
        syscall

        bne $t0,$t1,dif
        li $v0,1
        lw $a0,same
        syscall

        li $v0,10
        syscall

    dif:
        li $v0,1
        lw $a0,different
        syscall

        li $v0,10
        syscall
