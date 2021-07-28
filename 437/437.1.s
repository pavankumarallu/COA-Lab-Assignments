.data
	message1 : .asciiz "Enter the radius of the Circle : "
	message2 : .asciiz "The Area of the circle : "
	message3 : .asciiz "The perimeter of the circle : "
	PI : .float 3.14159
	radius : .float 0.0
	zeroo : .float 0.0
	nl : .asciiz "\n"



.text
main:

l.s $f1,PI
l.s $f2,radius
l.s $f4,zeroo

li $v0,4
la $a0,message1
syscall

li $v0,6
syscall

add.s $f2,$f0,$f4 #$f2 = $f0+$f4
mul.s $f5,$f2,$f2 

li $v0,4
la $a0,message2
syscall

li $v0,2
mul.s $f12,$f5,$f1
syscall


li $v0,4
la $a0,nl
syscall

li $v0,4
la $a0,message3
syscall

add.s $f6,$f2,$f2

li $v0,2
mul.s $f12,$f1,$f6
syscall


li $v0,10
syscall
