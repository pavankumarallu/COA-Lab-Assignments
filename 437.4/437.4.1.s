.data
	nl : .asciiz "\n"
	Message1: .asciiz "Enter an 8-Bit Number : "
	Message2: .asciiz "Enter an 8-Bit Number : "
	Message3: .asciiz "Enter an option from the following to perform an operation :"
	Message4: .asciiz "1. ADD\n2. SUB\n3. XOR\n4. AND\n5.EXIT\n"
	Message5: .asciiz "The performed Operation is ADD !!! \n"
	Message6: .asciiz "The performed Operation is SUB !!! \n"
	Message7: .asciiz "The performed Operation is XOR !!! \n"
	Message8: .asciiz "The performed Operation is AND !!! \n"
	Message9: .asciiz "The answer is: "


.text
    main:
    	li $t1,1
    	li $t2,2
    	li $t3,3
    	li $t4,4
    	li $t5,5

    mainloop:
    	li $v0,4
    	la $a0,nl
    	syscall
    	li $v0,4
    	la $a0,Message1
    	syscall
    	li $v0,5
    	syscall
    	move $s0,$v0

    	li $v0,4
    	la $a0,Message2
    	syscall
    	li $v0,5
    	syscall
    	move $s1,$v0

    	li $v0,4
    	la $a0,Message3
    	syscall

    	li $v0,5
    	syscall
    	move $s2,$v0

    	j switch

    switch:
    	beq $s2, $t1, ADD
		beq $s2, $t2, SUB
		beq $s2, $t3, XOR
		beq $s2, $t4, AND
		beq $s2, $t5, EXIT

	ADD:
		li $v0,4
    	la $a0,Message5
    	syscall

    	add $s3,$s0,$s1

    	li $v0,4
    	la $a0,Message9
    	syscall
    	li $v0,1
    	move $a0,$s3
    	syscall

    	li $v0,4
    	la $a0,nl
    	syscall



    	j mainloop

    SUB:
		li $v0,4
    	la $a0,Message6
    	syscall

    	sub $s3,$s0,$s1

    	li $v0,4
    	la $a0,Message9
    	syscall
    	li $v0,1
    	move $a0,$s3
    	syscall

    	li $v0,4
    	la $a0,nl
    	syscall

    	j mainloop

    XOR:
		li $v0,4
    	la $a0,Message7
    	syscall

    	xor $s3,$s0,$s1

    	li $v0,4
    	la $a0,Message9
    	syscall
    	li $v0,1
    	move $a0,$s3
    	syscall

    	li $v0,4
    	la $a0,nl
    	syscall

    	j mainloop

    AND:
		li $v0,4
    	la $a0,Message8
    	syscall

    	and $s3,$s0,$s1

    	li $v0,4
    	la $a0,Message9
    	syscall
    	li $v0,1
    	move $a0,$s3
    	syscall

    	li $v0,4
    	la $a0,nl
    	syscall



    	j mainloop

    EXIT: 
    	li $v0,10
    	syscall

    		




    	


    	
    	


