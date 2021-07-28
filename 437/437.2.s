
.data
	message1 : .asciiz "Enter the side of the square : "
	message2 : .asciiz "The length of the diagonal of square : "
	message3 : .asciiz "The area of the Square : "
	nl : .asciiz "\n"
	root2 : .float 1.414213
	half : .float 0.5
	zeroo : .float 0.0

.text
	main:
		l.s $f1,root2
		l.s $f2,half
		l.s $f3,zeroo

		li $v0,4
		la $a0,message1
		syscall

		li $v0,6
		syscall

		add.s $f4,$f0,$f3

		li $v0,4
		la $a0,message2
		syscall


		li $v0,2
		mul.s $f12,$f1,$f4
		syscall


		li $v0,4
		la $a0,nl
		syscall



		li $v0,4
		la $a0,message3
		syscall

		mul.s $f5,$f1,$f4
		mul.s $f6,$f5,$f5

		li $v0,2
		mul.s $f12,$f2,$f6
		syscall

		li $v0,10
		syscall


