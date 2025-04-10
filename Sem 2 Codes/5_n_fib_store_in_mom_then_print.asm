.data   		#assembly directive for  declaring variables or constant or strings	
	prompt: .asciiz "Enter the number of terms : "		#char prompt[]="Enter the number of terms :\0";
	prompt1: .asciiz "Fibonacci series :\n" #char prompt1[]="Fibonacci series :\n\0";
	prompt2: .asciiz "\t"  	#char prompt2[]="\t\0";
	array: .space 100   	#array[100];
.text  		#assembly directive for defining functions
main:  	#main
	la $a0, prompt 	#load address content of prompt into $a0 register
	li $v0, 4  #syscall-4-print string
		syscall
	li $v0, 5  #syscall-5-read integer and saves it in $v0 register
		syscall
	move $t1, $v0 	#$t1=$v0;
	mul $t1, $t1, 4  	#$t1=$t1*4  each integer takes 4 bytes
	jal fibonacciArray 	#jumping to the label fibonacciArray and saving return address to $ra register
	jal display 		#jumping to the label display and saving return address to $ra register
	li $v0, 10  #syscall-10-exit
		syscall
fibonacciArray: 		#function1
	li $t0, 0   #$t0=0   	loop counter
	li $t2, 0  #$t2=0 fibonacci 1
	li $t3, 1  #$t3=1 fibonacci 2
	loop:     		
		beq $t0, $t1, exit #if($t0==$t1){goto exit;}	
		sb $t2, array($t0) #array[$t0]=$t2; 		
		add $t0, $t0, 4 #$t0=$t0+4;  integer space incrementing for array
		add $t6, $t2, $t3 #$t6=$t2+$t3;  
		move $t2, $t3 	#$t2=$t3;
		move $t3, $t6 	#$t3=$t6;
		j loop 		#goto loop;
	exit:  
	jr $ra  #return;  	returning to main function
display:  	#function2
	li $t0, 0  #$t0=0;  	loop counter
	la $a0, prompt1 	#load address content of prompt into $a0 register
	li $v0, 4  #syscall-4-print string
		syscall
	loop1:    		
		beq $t0, $t1, exit1 #if($t0==$t1){goto exit1;}
		lb $t3, array($t0) #$t3=array[$t0]; 	
		add $t0, $t0, 4  #$t0=$t0+4;  integer space incrementing for array
		la $a0, ($t3) 	#load address content of ($t3) into $a0 register
		li $v0, 1 		#syscall-1-print integer
 syscall
		la $a0, prompt2 #load address content of prompt2 into $a0 register
		li $v0, 4 		#syscall-4-print string
 syscall
		j loop1 		#goto loop1;
	exit1:  
	jr $ra  #return;   	returning to main function
