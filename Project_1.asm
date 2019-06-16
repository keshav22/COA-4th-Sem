.data
msg1: .asciiz " \n Enter the Choice 1/2/3\n "
msg2: .asciiz "\n=====================\n"
msg3: .asciiz " 1. Temperature\n"
msg4: .asciiz " 2. Length\n"
msg5: .asciiz " 3. Exit\n"
msg6: .asciiz " The Choice is => "
msg7: .asciiz "\n =====================\n Wrong Entry Enter again!!\n =====================\n"
msg8: .asciiz "\n You Choosed Temperature\n"
msg9: .asciiz " Choose The Unit Of the Value You Want To Enter\n"
msg10: .asciiz " 1. Celcius\n 2. Fahrenheit\n 3. Kelvin\n 4. Exit\n"
msg11: .asciiz " Enter the Value => "
msg12: .asciiz "\n Choose The Unit to which you want to convert \n"
msg13: .asciiz " 1. Celcius\n 2. Fahrenheit\n 3. Exit\n"
msg14: .asciiz " 1. Celcius\n 2. Kelvin\n 3. Exit\n"
msg15: .asciiz " 1. Kelvin\n 2. Fahrenheit\n 3. Exit\n"
msg16: .asciiz "The Converted Celcius Value is => "
msg17: .asciiz "The Converted Kelvin Value is => "
msg18: .asciiz "The Converted Fahrenheit Value is => "
msg21: .asciiz "Choose the Unit in which you will input\n"
msg22: .asciiz "1. Meter\n"
msg23: .asciiz "2. Centimeter\n"
msg24: .asciiz "3. Inch\n"
msg25: .asciiz "4. Feet\n"
msg26: .asciiz "5. Km\n"
msg27: .asciiz "6. Exit\n"
msg28: .asciiz "\nEnter the Choice ="
msg29: .asciiz "\n\nChoose the Unit to which you want to convert\n\n"
msg30: .asciiz "\nEnter the Number =\n"
msg31: .asciiz "\nThe Converted value is "
km1: .float 39370.1
km2: .float 3280.84
km3: .float 100000.0
km4: .float 1000.0
m1: .float 39.3701
m2: .float 3.28084
m3: .float 100.0
m4: .float 1000.0
cn1: .float 0.393701
cn2: .float 0.0328084
cn3: .float 0.001
cn4: .float 0.00001
ft1:  .float 0.00030
ft2:  .float 12.0
ft3: .float 30.48
ft4: .float 0.3048
in4: .float 0.0000254
in1: .float 0.0254
in2: .float 2.54
in3: .float 0.083333
k1: .word 6
k2: .word 5
k3: .word 4
k4: .word 3
k5: .word 2
k6: .word 1

p: .word 1
q: .word 2
r: .word 3
s: .word 4
t: .float 0.55556
u: .float 273.15
v: .float 459.67
w: .float 32.0
.text
main:

loop:

	la $a0,msg1			#Displaying the Choices Temperature or Length
	li $v0,4
	syscall

	la $a0,msg2
	li $v0,4
	syscall

	la $a0,msg3
	li $v0,4
	syscall

	la $a0,msg4
	li $v0,4
	syscall

	la $a0,msg5
	li $v0,4
	syscall

	la $a0,msg6
	li $v0,4
	syscall

	li $v0,5			#Reading the Choice and Storing in $t0
	syscall	
	move $t0,$v0

	lw $t1,p			#Assigning Some variables with Values to compare
	lw $t2,q
	lw $t3,r
	lw $t4,s

	beq $t0,$t1,Temp
	beq $t0,$t2,length
	beq $t0,$t3,exit
	
	la $a0,msg7
	li $v0,4
	syscall

	j loop
	
Temp:

	la $a0,msg8
	li $v0,4
	syscall	

	la $a0,msg2
	li $v0,4
	syscall
	
	la $a0,msg9			#Displaying the choices of Temperature Units user wants to enter 
	li $v0,4
	syscall

	la $a0,msg10
	li $v0,4
	syscall

	la $a0,msg6
	li $v0,4
	syscall

	li $v0,5			#Reading the Choice and Storing in $t0
	syscall	
	move $t0,$v0
				
	
	beq $t0,$t1,celcius
	beq $t0,$t2,fahrenheit
	beq $t0,$t3,kelvin	
	beq $t0,$t4,exit
	
	la $a0,msg7
	li $v0,4
	syscall

	j Temp

celcius:
	
		
	
	la $a0,msg11			#Entering THe Value
	li $v0,4
	syscall	
	
	li $v0,6
	syscall	
	mov.s $f1,$f0	

	la $a0,msg12
	li $v0,4
	syscall
	
	la $a0,msg15
	li $v0,4
	syscall
	
	la $a0,msg6
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t9,$v0

	beq $t9,$t1,Kelvin_1
	beq $t9,$t2,Fahrenheit_1
	beq $t9,$t3,exit
		
	la $a0,msg7
	li $v0,4
	syscall

	j celcius
	
				
fahrenheit:

	la $a0,msg11			#Entering THe Value
	li $v0,4
	syscall

	li $v0,6
	syscall	
	mov.s $f1,$f0	
		
	la $a0,msg12
	li $v0,4
	syscall
		
	la $a0,msg14
	li $v0,4
	syscall

	la $a0,msg6
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t9,$v0

	beq $t9,$t1,Celcius_1
	beq $t9,$t2,Kelvin_1
	beq $t9,$t3,exit
	
	la $a0,msg7
	li $v0,4
	syscall

	j fahrenheit

kelvin:
	la $a0,msg11			#Entering THe Value
	li $v0,4
	syscall

	li $v0,6
	syscall	
	mov.s $f1,$f0

	la $a0,msg12
	li $v0,4
	syscall
	
	la $a0,msg13
	li $v0,4
	syscall

	la $a0,msg6
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t9,$v0

	beq $t9,$t1,Celcius_1
	beq $t9,$t2,Fahrenheit_1
	beq $t9,$t3,exit

	la $a0,msg7
	li $v0,4
	syscall

	j kelvin

Kelvin_1:
		beq $t0,$t1,l1
		beq $t0,$t2,l2	
	l1:	
		l.s $f2,u
		add.s $f3,$f1,$f2
		
		la $a0,msg2
		li $v0,4
		syscall
			
	
		la $a0,msg17
		li $v0,4
		syscall
				
		mov.s $f12,$f3
		li $v0,2
		syscall

		la $a0,msg2
		li $v0,4
		syscall

		j loop

		
	l2:
		l.s $f5,v 	
		add.s $f2,$f1,$f5
		l.s $f3,t;
		mul.s $f4,$f2,$f3
		
		la $a0,msg2
		li $v0,4
		syscall
		
		la $a0,msg17
		li $v0,4
		syscall
		
		mov.s $f12,$f4
		li $v0,2
		syscall
		
		la $a0,msg2
		li $v0,4
		syscall

		j loop
			
Celcius_1:
		beq $t0,$t2,l3
		beq $t0,$t3,l4

	l3:	
		l.s $f3,t
		l.s $f4,w
		sub.s $f5,$f1,$f4
		mul.s $f6,$f5,$f3
		
		la $a0,msg2
		li $v0,4
		syscall
		
		la $a0,msg16
		li $v0,4
		syscall
		
		mov.s $f12,$f6
		li $v0,2
		syscall
		
		la $a0,msg2
		li $v0,4
		syscall

		j loop

	l4:
		l.s $f2,u
		sub.s $f3,$f1,$f2
		
		la $a0,msg2
		li $v0,4
		syscall
		
		la $a0,msg16
		li $v0,4
		syscall
		
		mov.s $f12,$f3
		li $v0,2
		syscall
		
		la $a0,msg2
		li $v0,4
		syscall

		j loop

Fahrenheit_1:
		beq $t0,$t1,l5
		beq $t0,$t3,l6
	l5:
		l.s $f2,t
		l.s $f5,w
		div.s $f3,$f1,$f2
		add.s $f4,$f3,$f5
		
		la $a0,msg2
		li $v0,4
		syscall
		
		la $a0,msg18
		li $v0,4
		syscall
		
		mov.s $f12,$f4
		li $v0,2
		syscall
		
		la $a0,msg2
		li $v0,4
		syscall

		j loop				
	l6:
		l.s $f2,t
		l.s $f3,u
		l.s $f4,w
		sub.s $f5,$f1,$f3
		div.s $f6,$f5,$f2
		add.s $f7,$f6,$f4

		la $a0,msg2
		li $v0,4
		syscall
		
		la $a0,msg18
		li $v0,4
		syscall
		
		mov.s $f12,$f7
		li $v0,2
		syscall
		
		la $a0,msg2
		li $v0,4
		syscall

		j loop		

length:

	la $a0,msg21
	li $v0,4
	syscall
		
	la $a0,msg22
	li $v0,4
	syscall

	la $a0,msg23
	li $v0,4
	syscall

	la $a0,msg24
	li $v0,4
	syscall

	la $a0,msg25
	li $v0,4
	syscall
	
	la $a0,msg26
	li $v0,4
	syscall
	
	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t1,$v0	

	lw $t2,k1
	lw $t3,k2
	lw $t4,k3
	lw $t5,k4
	lw $t6,k5 
	lw $t7,k6
	
	beq $t1,$t3,km		
	beq $t1,$t4,feet
	beq $t1,$t5,inch
	beq $t1,$t6,centimeter
	beq $t1,$t7,meter
	beq $t1,$t2,exit	
		
	
	la $a0,msg7
	li $v0,4
	syscall	

	j length
	
feet:
	la $a0,msg29
	li $v0,4
	syscall
		
	la $a0,msg22
	li $v0,4
	syscall

	la $a0,msg23
	li $v0,4
	syscall

	la $a0,msg24
	li $v0,4
	syscall

	
	la $a0,msg26
	li $v0,4
	syscall
	
	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t8,$v0
	
	beq $t8,$t3,km_1		
	beq $t8,$t5,inch_1
	beq $t8,$t6,centimeter_1
	beq $t8,$t7,meter_1
	beq $t8,$t2,exit		

	la $a0,msg7
	li $v0,10

	j feet
km_1:	
	la $a0,msg30
	li $v0,4
	syscall

	li $v0,6
	syscall
	
	mov.s $f1,$f0
		
	beq $t1,$t4,l20
	beq $t1,$t5,l21
	beq $t1,$t6,l22
	beq $t1,$t7,l23
	
	l20:
	
		l.s $f2,ft1
		mul.s $f3,$f1,$f2
		j ans
	l21:
		l.s $f2,in4
		mul.s $f3,$f1,$f2
		j ans
					
	l22:
		l.s $f2,cn4
		mul.s $f3,$f1,$f2
		j ans

	l23:
		l.s $f2,m4
		mul.s $f3,$f1,$f2
		j ans
feet_1:

	la $a0,msg30
	li $v0,4
	syscall

	li $v0,6
	syscall
	
	mov.s $f1,$f0
	beq $t1,$t3,l24		
	beq $t1,$t5,l25
	beq $t1,$t6,l26
	beq $t1,$t7,l27
	
	l24:	
		l.s $f2,km2
		mul.s $f3,$f1,$f2
		j ans
		
	l25:
		l.s $f2,in3
		mul.s $f3,$f1,$f2
		j ans
	l26:
		l.s $f2,cn2
		mul.s $f3,$f1,$f2
		j ans
	l27:
		l.s $f2,m2
		mul.s $f3,$f1,$f2
		j ans

inch_1:
	la $a0,msg30
	li $v0,4
	syscall

	li $v0,6
	syscall
	
	mov.s $f1,$f0
		
	beq $t1,$t4,l29
	beq $t1,$t3,l28
	beq $t1,$t6,l30
	beq $t1,$t7,l31
	l28:
		l.s $f2,km1
		mul.s $f3,$f1,$f2
		j ans
	l29:
		l.s $f1,ft2
		mul.s $f3,$f2,$f1
		j ans
	l30:
		l.s $f2,cn1
		mul.s $f3,$f1,$f2
		j ans
	l31:
		l.s $f2,m1
		mul.s $f3,$f1,$f2
		j ans

centimeter_1:
	la $a0,msg30
	li $v0,4
	syscall

	li $v0,6
	syscall
	
	mov.s $f1,$f0
	
	beq $t1,$t4,l34
	beq $t1,$t5,l33
	beq $t1,$t3,l32
	beq $t1,$t7,l35		
	l32:
		l.s $f2,km3
		mul.s $f3,$f1,$f2
		j ans
	l33:
		l.s $f2,in2
		mul.s $f3,$f2,$f1
		j ans
	l34:
		l.s $f2,ft3
		mul.s $f3,$f2,$f1
		j ans
	l35:
		l.s $f2,m3
		mul.s $f3,$f1,$f2
		j ans		

meter_1:
	la $a0,msg30
	li $v0,4
	syscall

	li $v0,6
	syscall
	
	mov.s $f1,$f0
	beq $t1,$t4,l39
	beq $t1,$t5,l37
	beq $t1,$t6,l38
	beq $t1,$t3,l36
	l36:
		l.s $f2,km4
		mul.s $f3,$f1,$f2
		j ans
	l37:
		l.s $f2,in1
		mul.s $f3,$f2,$f1
		j ans
	l38:
		l.s $f2,cn3
		mul.s $f3,$f1,$f2
		j ans
	l39:
		l.s $f2,ft4
		mul.s $f3,$f1,$f2
		j ans

inch:
	la $a0,msg29
	li $v0,4
	syscall
		
	la $a0,msg22
	li $v0,4
	syscall

	la $a0,msg23
	li $v0,4
	syscall

	la $a0,msg25
	li $v0,4
	syscall
	
	la $a0,msg26
	li $v0,4
	syscall
	
	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t8,$v0
	
	beq $t8,$t3,km_1
	beq $t8,$t4,feet_1		
	beq $t8,$t6,centimeter_1
	beq $t8,$t7,meter_1
	beq $t8,$t2,exit		

	la $a0,msg7
	li $v0,10

	j inch 

centimeter:

	la $a0,msg29
	li $v0,4
	syscall
		
	la $a0,msg22
	li $v0,4
	syscall

	la $a0,msg24
	li $v0,4
	syscall
	
	la $a0,msg25
	li $v0,4
	syscall
	
	la $a0,msg26
	li $v0,4
	syscall
	
	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t8,$v0

	beq $t8,$t3,km_1
	beq $t8,$t4,feet_1		
	beq $t8,$t5,inch_1
	beq $t8,$t7,meter_1
	beq $t8,$t2,exit		

	la $a0,msg7
	li $v0,10

	j centimeter

meter:
	la $a0,msg29
	li $v0,4
	syscall

	la $a0,msg23
	li $v0,4
	syscall

	la $a0,msg24
	li $v0,4
	syscall
	
	la $a0,msg25
	li $v0,4
	syscall
	
	la $a0,msg26
	li $v0,4
	syscall
	
	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t8,$v0

	beq $t8,$t3,km_1
	beq $t8,$t4,feet_1		
	beq $t8,$t5,inch_1
	beq $t8,$t6,centimeter_1
	beq $t8,$t2,exit		

	la $a0,msg7
	li $v0,10

	j meter
		
km:
	la $a0,msg29
	li $v0,4
	syscall
		
	la $a0,msg22
	li $v0,4
	syscall

	la $a0,msg23
	li $v0,4
	syscall

	la $a0,msg24
	li $v0,4
	syscall
	
	la $a0,msg25
	li $v0,4
	syscall

	la $a0,msg27
	li $v0,4
	syscall

	la $a0,msg28
	li $v0,4
	syscall

	li $v0,5
	syscall
	move $t8,$v0 
		
	beq $t8,$t4,feet_1		
	beq $t8,$t5,inch_1
	beq $t8,$t6,centimeter_1
	beq $t8,$t7,meter_1
	beq $t8,$t2,exit		

	la $a0,msg7
	li $v0,10

	j km
ans :

	la $a0,msg31
	li $v0,4
	syscall
	
	mov.s $f12,$f3
	li $v0,2
	syscall

	j exit
	
exit:	
	li $v0,10
	syscall
