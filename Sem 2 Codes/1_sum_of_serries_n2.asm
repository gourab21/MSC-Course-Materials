.data   #assembly directive for  declaring variables or constant or strings
	promt1: .asciiz "\nEnter the number of terms : "	#char promt1[]="Enter the number of terms : \0";
	promt2: .asciiz "Answer is :" #char promt2[]="Answer is : \0";
.text  #assembly directive for defining functions
.globl main  #assembly directive for  making function available for global use
main:  	#main
	la $a0,promt1 #load address content of prompt1 into $a0 register
	li $v0,4   #syscall-4-print string from $a0 register
		syscall
	li $v0,5  #syscall-5-read integer and saves it in $v0 register
		syscall	
	move $t1,$v0 #$t1=$v0;
	li $t0,1  #$t0=1;
	loop:  
   bgt $t0,$t1,exit #if($t6==$t1){goto exit;}
   jal power #jumping to the label power and saving return address to $ra register
    jal addition 	#jumping to the label addition and saving return address to $ra register
   add $t0,$t0,1 	#$t0=$t0+1;
    j loop   #goto loop;
	exit:
	la $a0,promt2 #load address content of prompt2 into $a0 register
	li $v0,4  #syscall-4-print string from $a0 register
		syscall	
	la $a0, ($t4) #load address content of ($t4) into $a0 register
	li $v0, 1  #syscall-1-print integer in $a0 register
		syscall
	li $v0,10  #syscall-10-exit
		syscall
power:
	mul $t2,$t0,$t0 	#$t2=$t0*$t0;
jr $ra  	#returns to the next line of function call
addition:
	add $t4,$t4,$t2 	#$t4=$t4+$t2;
jr $ra  	#returns to the next line of function call
