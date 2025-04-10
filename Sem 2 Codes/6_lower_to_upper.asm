.data 		#assembly directive for  declaring variables or constant or strings
	prompt: .asciiz "Enter the string : "	#char prompt[]="Enter the string : \0";
	input: .space 50					#input[40];
.text 			#assembly directive for defining functions
.globl main 	#assembly directive for  making function available for global use
main: 		
	la $a0,prompt #load address content of prompt into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	la $a0,input #load address content of input string array into $a0 register, address of input buffer
	la $a1,30 	#load address content '30' into $a1 register  for maximum number of characters to read
	li $v0,8 	#syscall-8-read string and save it to input array
		syscall
	li $t1,0 	#$t1=0;
	loop:
		lbu $t2,input($t1)	#input[$t1]=$t2;
		beq $t2,10,exit	#if($t2==10){goto exit;}  ,		ASCII(10) is for 'Line Feed' or 'Newline Character'
		la $t3,($t2)	#load address content of ($t2) into $t3 register
		blt $t2,97,continue	#if($t2<97){goto continue;} ,		ASCII(97) is for lowercase a
		sub $t3,$t3,32	#$t3=$t3-32;					converting the ASCII value to uppercase
		continue:
		la $a0,($t3)	#load address content of ($t3) into $a0 register
		li $v0,11 #syscall-4-print character from $a0 register
			syscall
		here:
		add $t1,$t1,1	#$t1=$t1+1;			character space incrementing for array input
		j loop #goto loop;
	exit:
	li $v0,10 	#syscall-10-exit
		syscall

