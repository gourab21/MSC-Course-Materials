.data  		#assembly directive for  declaring variables or constant or strings
	array: .space 400 				#array[40];
	prompt: .asciiz "Enter the element : "				#char prompt[]="Enter the element : \0";
	prompt1: .asciiz "The array is : " #char prompt1[]="The array is : \0";
	prompt2: .asciiz "\t" 			#char prompt2[]="\t\0";
	prompt3: .asciiz "\nThe average is : "				#char prompt3[]="\nThe average is : \0";
	prompt4: .asciiz "Enter the number of elements : "		#char prompt4[]="Enter the number of elements : \0";
.text 			#assembly directive for defining functions
.globl main 	#assembly directive for  making function available for global use
main: 
	jal insert  	#jumping to the label insert and saving return address to $ra register
	jal display #jumping to the label display and saving return address to $ra register
	jal average #jumping to the label average and saving return address to $ra register
	la $a0,prompt3				#load address content of prompt3 into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	mov.s $f12,$f3				#$f12=$f3;
	li $v0,2 	#syscall-4-print float from $f12 register
		syscall 
	li $v0,10 	#syscall-10-exit
		syscall
average:
	mtc1 $s1, $f12 				#$f12=$s1;	converting integer register to float register
	cvt.s.w $f2, $f12				#$f2=$f12;	convert word for single precision
	div.s $f3,$f2,$f1				#$f3=$f2/$f1;	float division
	jr $ra  	#returns to the next line of function call
insert: 
	la $a0,prompt4				#load address content of prompt4 into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	li $v0,5 	#syscall-5-read integer and saves it in $v0 register
		syscall
	move $t1,$v0 #$t1=$v0;
	la $t4,($t1) #load address content of ($t4) into $t4 register
	mtc1 $t1, $f12				#$f12=$t1;	converting integer register to float register
	cvt.s.w $f1, $f12				#$f1=$f12;	convert word for single precision
	mul $t1,$t1,4  #$t1=$t1*4;
	li $t0,0 	#$t0=0;
	loop:
		beq $t0,$t1,exit 			#if($t0==$t1){goto exit;}
		la $a0,prompt				#load address content of prompt into $a0 register
		li $v0,4 #syscall-4-print string from $a0 register
			syscall
		li $v0,5 #syscall-5-read integer and saves it in $v0 register
			syscall
		move $s0,$v0			#$s0=$v0;
		add $s1,$s1,$s0			#$s1=$s1+$s0;
		sw $s0,array($t0) 			#array[$t0]=$s0;
		add $t0,$t0,4 				#$t0=$t0+4;			integer space incrementing for array
		j loop  #goto loop;
	exit:
	jr $ra  	#returns to the next line of function call
display:	
	li $t0,0 	#$t0=0;
	la $a0,prompt1				#load address content of prompt1 into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	loop1: 
		beq $t0,$t1,exit1 			#if($t0==$t1){goto exit1;}
		lw $t3,array($t0) 			#$t3=array[$t0];
		la $a0, ($t3)				#load address content of ($t3) into $a0 register
		li $v0, 1 #syscall-1-print integer in $a0 register
			syscall 
		la $a0,prompt2			#load address content of prompt2 into $a0 register
		li $v0,4 #syscall-4-print string from $a0 register
			syscall
		add $t0,$t0,4 				#$t0=$t0+4;			integer space incrementing for array
		j loop1 #goto loop1;
	exit1:
	jr $ra  	#returns to the next line of function call
