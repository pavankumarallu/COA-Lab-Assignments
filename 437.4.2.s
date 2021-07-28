.data
	array1 : .word 1 0 1
	array2 : .word 1 1 1
	msg : .asciiz "\nDone\n"

.text
    main:
    	li $t1 3
    	li $s1 1
    	li $s2 0
    	la $a1 array1
    	la $a2 array2

    	loop1:
    		beqz $t1,exit
    		lw $t3 0($a1)
    		lw $t4 0($a2)
    		add $a1,$a1,4
    		add $a2,$a2,4
    		add $t1,$t1,-1

    		and $t


    		bnez $t1,loop1




    		




    	exit:
    		li $v0,4
    		la $a0,msg
    		syscall

    		li $v0,10
    		syscall


