.data
	prompt: .asciiz "\nEnter the number : "		# char prompt[]="\nEnter the number :\0";
	prompt1: .asciiz "Factorial is : " # char prompt1[]="Factorial is : \0";
.text
.globl main
main:
	la $a0, prompt # load address content of prompt into $a0 register
	li $v0, 4 	# syscall-4-print string from $a0 register
		syscall
	li $v0, 5 	# syscall-5-read integer and saves it in $v0 register
		syscall
	move $t0, $v0 # $t0=$v0;
	jal fact 	# jumping to the label fact and saving return address to $ra register
	la $a0, prompt1 # load address content of prompt1 into $a0 register (corrected from promtp1)
	li $v0, 4 	# syscall-4-print string from $a0 register
		syscall
	la $a0, ($t2) # load address content of ($t2) into $a0 register
	li $v0, 1 	# syscall-1-print integer in $a0 register
		syscall
	li $v0, 10 	# syscall-10-exit
		syscall
fact:		
	li $t1, 1 	# $t1=1;
	li $t2, 1 	# $t2=1;
	loop:
		beq $t1, $t0, exit	# if($t1==$t0){goto exit;}
		mul $t2, $t2, $t0	# $t2=$t2*$t0;
		sub $t0, $t0, 1		# $t0=$t0-1;	
		j loop 	# goto loop;
	exit:
	jr $ra 		# returns to the next line of function call
