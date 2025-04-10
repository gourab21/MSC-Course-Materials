.data   #assembly directive for  declaring variables or constant or strings
	array: .space 40  	#array[40];
	stack: .space 40  	#stack[40];
	promt: .asciiz "Enter the element  : " 	#char promt[]="Enter the element  : \0";
	promt1: .asciiz "The array is : " 		#char promt1[]="The array is : \0";
	promt2: .asciiz "\nEnter the number of elements : "		#char promt2[]="\nEnter the number of elements : \0";
	promt3: .asciiz "\t"  #char promt3[]="\t\0";
	promt4: .asciiz "\nReversed array : " 	#char promt4[]="\nReversed array :\0";
.text  #assembly directive for defining functions
.globl main 		#assembly directive for  making function available for global use
main:
	jal insert 		#jumping to the label insert and saving return address to $ra register
	la $a0,promt1 	#load address content of prompt1 into $a0 register
	li $v0,4 		#syscall-4-print string from $a0 register
		syscall
	jal display 	#jumping to the label display and saving return address to $ra register
	jal reversed 	#jumping to the label reversed and saving return address to $ra register
	la $a0,promt4 	#load address content of prompt4 into $a0 register
	li $v0,4 		#syscall-4-print string from $a0 register
		syscall
	jal display 	#jumping to the label display and saving return address to $ra register
	li $v0,10 		#syscall-10-exit
		syscall 
reversed:
	move $s2,$ra 	#$s2=$ra;
	li $t0,0 		#$t0=0;
	loop3:
		beq $t0,$t1,exit3			#if($t0==$t1){goto exit3;}
		lw $s7,array($t0)			#$s7=array[$t0];
		jal push 	#jumping to the label push and saving return address to $ra register
		add $t0,$t0,4 #$t0=$t0+4;			integer space incrementing for array
		j loop3 	#goto loop3;
	exit3:
	li $t0,0 		#$t0=0;
	loop4:
		beq $t0,$t1,exit4			#if($t0==$t1){goto exit4;}
		jal pop 	#jumping to the label pop and saving return address to $ra register
		sw $s7,array($t0)			#array[$t0]=$s7;
		add $t0,$t0,4 #$t0=$t0+4;			integer space incrementing for array
		j loop4 	#goto loop4;
	exit4:
	move $ra,$s2 	#$ra=$s2;
	jr $ra 		#returns to the next line of function call
push:
	sw $s7,stack($s6) #stack[$s6]=$s7;
	add $s6,$s6,4 #$s6=$s6+4;			integer space incrementing for array
	jr $ra 		#returns to the next line of function call
pop:
	sub $s6,$s6,4 #$t6=$t6-4;			integer space decrementing for array
	lw $s7,stack($s6) #$s7=stack[$s6];
	jr $ra 		#returns to the next line of function call
insert:
	la $a0,promt2 	#load address content of prompt2 into $a0 register
	li $v0,4 		#syscall-4-print string from $a0 register
		syscall
	li $v0,5 		#syscall-5-read integer and saves it in $v0 register
		syscall
	move $t1,$v0 	#$t1=$v0;
	mul $t1,$t1,4 	#$t1=$t1*4;
	li $t0,0 		#$t0=0;
	loop:
		beq $t0,$t1,exit			#if($t0==$t1){goto exit;}
		la $a0,promt #load address content of prompt into $a0 register
		li $v0,4 	#syscall-4-print string from $a0 register
			syscall
		li $v0,5 	#syscall-5-read integer and saves it in $v0 register
			syscall
		move $s0,$v0			#$s0=$v0;
		sw $s0,array($t0)			#array[$t0]=$s0;
		add $t0,$t0,4 #$t0=$t0+4;			integer space incrementing for array
		j loop 	#goto loop;
	exit:
	jr $ra 		#returns to the next line of function call
display:
	li $t0,0 		#$t0=0;
	loop1:
		beq $t0,$t1,exit1			#if($t0==$t1){goto exit1;}
		lw $t3,array($t0)			#$t3=array[$t0];
		la $a0, ($t3) #load address content of ($t3) into $a0 register
		li $v0, 1 	#syscall-1-print integer in $a0 register
			syscall
		la $a0,promt3 #load address content of prompt3 into $a0 register
		li $v0,4 	#syscall-4-print string from $a0 register
			syscall
		add $t0,$t0,4 #$t0=$t0+4;			integer space incrementing for array
		j loop1 	#goto loop1;
	exit1:
	jr $ra 		#returns to the next line of function call

