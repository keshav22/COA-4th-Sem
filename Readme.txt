.data
msg1: .asciiz "Enter the Choice 1/2\n "
msg2: .asciiz "=====================\n"
msg3: .asciiz "1. Temperature\n"
msg4: .asciiz "2. Lengthn\n"
.text
main:
la $a0,msg1
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
li $v0,10
syscall