.data
	message1:   .asciiz "Please enter values for n, k, and m (i.e. (nxk) and (kxm)):\n"
	message2:  	.asciiz "Please enter values for the first matrix A ("
	message3:  	.asciiz "Please enter values for the second matrix B ("
	message4:  	.asciiz "x"
	message5:  	.asciiz "):\n"
	message6:  	.asciiz "|"
	message7:  	.asciiz "|\n"
	message8:  	.asciiz " "
	message9:  	.asciiz "\n"
	message10:  .asciiz "multiplied by\n"
	message11:	.asciiz "equals\n"

			.text
main:

		la $a0, message1
		li $v0, 4     		
		syscall
		li $v0, 5
		syscall		
		move $t0, $v0
		li $v0, 5
		syscall			
		move $t1, $v0
		li $v0, 5
		syscall
		move $t2, $v0

		li $v0, 4
		la $a0, message2	
		syscall
		li $v0, 1
		move $a0, $t0 	
		syscall
		li $v0, 4
		la $a0, message4		
		syscall
		li $v0, 1
		move $a0, $t1   
		syscall
		li $v0, 4
		la $a0, message5    	
		syscall

		li $t3, 0           
		mul $t4, $t0, $t1   
		mul $s5, $t1, $t2   
		mul $t8, $t4, 4     
		j mat1_init


mat1_init:


        move $a0, $t8
        li $v0, 9
        syscall
        move $s0, $v0       	
        move $t6, $s0       	
        j mat1


mat1:

		beq $t3, $t4, mat2_init

		li $v0, 5           
		syscall

		move $t5, $v0       
		sw $t5, 0($s0)      

		addi $s0, $s0, 4    
		addi $t3, $t3, 1    
		j mat1


mat2_init:

		li $v0, 4
		la $a0, message3	
		syscall
		li $v0, 1
		move $a0, $t1 	
		syscall
		li $v0, 4
		la $a0, message4	
		syscall
		li $v0, 1
		move $a0, $t2     
		syscall
		li $v0, 4
		la $a0, message5   
		syscall

        move $a0, $t8
        li $v0, 9
        syscall
        move $s1, $v0       	
        move $t7, $s1       	

        move $t3, $zero     	
		j mat2


mat2:

		beq $t3, $s5, mat1_print_init

		li $v0, 5         
		syscall

		move $t5, $v0      
		sw $t5, 0($s1)   	

		addi $s1, $s1, 4   	
		addi $t3, $t3, 1   	
		j mat2


mat1_print_init:

		la $a0, message9
		li $v0, 4          
		syscall

		move $s0, $t6      	
		li $t9, 0          	
		li $t5, 0          
		j mat1_left

mat1_left:

	    beq $t5, $t4, mat2_print_init
		la $a0, message6
		li $v0, 4        	
		syscall
		j mat1_print_numbers

mat1_print_numbers:

		beq $t9, $t1, mat1_right

		lw $t3, 0($s0)    	
		move $a0, $t3
		li $v0, 1          	
		syscall

		la $a0, message8
		li $v0, 4          	
		syscall

		addi $s0, $s0, 4   	
		addi $t9, $t9, 1   	
		addi $t5, $t5, 1   	
		j mat1_print_numbers

mat1_right:

		la $a0, message7
		li $v0, 4 
		syscall         	
 		li $t9, 0          
 		j mat1_left


mat2_print_init:

		la $a0, message10
		li $v0, 4          	
		syscall

		move $s1, $t7      	
		li $t9, 0          	
		li $t5, 0          
		j mat2_left

mat2_left:

	  beq $t5, $s5, multiply_init
		la $a0, message6
		li $v0, 4          	
		syscall
		j mat2_print_numbers

mat2_print_numbers:
		beq $t9, $t2, mat2_right

		lw $t3, 0($s1)     	
		move $a0, $t3
		li $v0, 1 
		syscall

		la $a0, message8
		li $v0, 4          
		syscall

		addi $s1, $s1, 4  
		addi $t9, $t9, 1  
		addi $t5, $t5, 1  
		j mat2_print_numbers

mat2_right:

		la $a0, message7
		li $v0, 4         	
 		syscall	
 		li $t9, 0          	
 		j mat2_left


multiply_init:

		li $t3, 0          	
		li $s4, 0           	
		li $s5, 0           	
		li $s7, 0           	
		mul $t4, $t0, $t2   	
		move $s0, $t6       	
		move $s1, $t7       	
		move $t0, $t7       	

		mul $s6, $t1, 4     	
		mul $t8, $t2, 4     	
		la $a0, message11
		li $v0, 4          	
		syscall
		la $a0, message6
		li $v0, 4           	
		syscall
		j matrix_load

matrix_load:

		beq $t3, $t1, print_and_reset
		lw $t5, 0($s0)      	
		addi $s0, $s0, 4    	

		lw $t9, 0($s1)      	
		add $s1, $s1, $t8   	
		mul $s3, $t5, $t9   	
		add $s4, $s4, $s3   	

		addi $t3, $t3, 1    	
		j matrix_load

print_and_reset:

		move $a0, $s4
		li $v0, 1           	
		syscall
		la $a0, message8
		li $v0, 4           	
		syscall

		move $s0, $t6

		addi $t0, $t0, 4
		move $s1, $t0

		addi $s5, $s5, 1    	
		addi $s7, $s7, 1    	
		li $t3, 0           	
		li $s4, 0           	

		beq $s5, $t4, EXIT
		beq $s7, $t2, mat1_next_row
		j matrix_load

mat1_next_row:

		add $t6, $t6, $s6
		move $s0, $t6
		move $s1, $t7
		move $t0, $t7

		li $s7, 0            	

		la $a0, message7
		li $v0, 4            	
		syscall
		la $a0, message6
		li $v0, 4            
		syscall
		j matrix_load


EXIT:

		la $a0, message7
		li $v0, 4            
		syscall
		jr $ra