.data
	nl : .asciiz "\n"
	Message1: .asciiz "Enter the Units: "
	Message2: .asciiz "Your Electricity Bill is :  Rs "
	Message3: .asciiz "Not Applicable !!! Only until 500 Units \n "



.text
	main:
		li $t1 0
		li $t2 100
		li $t3 200
		li $t4 400
		li $t5 500
		li $s1 100
		li $s2 50
		li $s3 125
		li $s4 200
		li $s5 500

	mainLoop:
		li $v0,4
		la $a0,Message1
		syscall

		li $v0,5
    	syscall
    	move $s0,$v0

    	bgt $s0,$t2,case1


    	add $s6,$s1,$zero
    	add $s6,$s6,$s2

    	li $v0,4
    	la $a0,Message2
    	syscall

    	li $v0,1
    	move $a0,$s6
    	syscall

    	li $v0,10
    	syscall


    case1:
    	 
    	bgt $s0,$t3,case2

    	add $s6,$s1,$zero
    	add $s6,$s6,$s3

    	li $v0,4
    	la $a0,Message2
    	syscall

    	li $v0,1
    	move $a0,$s6
    	syscall

    	li $v0,10
    	syscall

    case2:
    	bgt $s0,$t4,case3

    	add $s6,$s1,$zero
    	add $s6,$s6,$s3

    	li $v0,4
    	la $a0,Message2
    	syscall

    	li $v0,1
    	move $a0,$s6
    	syscall

    	li $v0,10
    	syscall

    case3:
    	bgt $s0,$t5,case4

    	add $s6,$s1,$zero
    	add $s6,$s6,$s5

    	li $v0,4
    	la $a0,Message2
    	syscall

    	li $v0,1
    	move $a0,$s6
    	syscall

    	li $v0,10
    	syscall

    case4:

    	li $v0,4
    	la $a0,Message3
    	syscall

    	li $v0,10
    	syscall

    case 5:
    	li 

    

    



    	








