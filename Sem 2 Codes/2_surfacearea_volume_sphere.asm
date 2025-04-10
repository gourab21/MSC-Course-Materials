.data 	#assembly directive for  declaring variables or constant or strings
	pi: .float 3.1415 		#float pi=3.1415
	const: .float 1.3334 	#float const=1.3334;		//value of 4/3
	const1: .float 4.000 	#float const1=4.00;
	promt: .asciiz "\nEnter the radius of the sphere : "	#char promt[]="\nEnter the radius of the sphere :\0";
	promt1: .asciiz "Volume of the sphere is  : "		#char promt[]="Volume of the sphere is  :\0";
	promt2: .asciiz "\nSurface area of the sphere is : "	#char promt[]="\nSurface area of the sphere is :\0";
.text 			#assembly directive for defining functions
.globl main 	#assembly directive for making function available for global use
main: 		#main
	l.s $f1, pi 	#$f1=pi;			//load single precision float number to float register 
	l.s $f2, const #$f2=const;		//load single precision float number to float register 
	l.s $f7,const1 #$f7=const1;		//load single precision float number to float register 
	la $a0,promt #load address content of prompt into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	li $v0,6 	#syscall-6-read float and save it to $f0
		syscall
	jal volume #jumping to the label volume and saving return address to $ra register
	la $a0,promt1 #load address content of promp1t into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	mov.s $f12,$f3					#$f12=$f3;
	li $v0,2 	#syscall-2-print float from the register $f12
		syscall
	jal surfaceArea					#jumping to the label surfaceArea and saving return address to $ra register
	la $a0,promt2 #load address content of prompt2 into $a0 register
	li $v0,4 	#syscall-4-print string from $a0 register
		syscall
	mov.s $f12,$f4					#$f12=$f4;
	li $v0,2 	#syscall-2-print float from the register $f12
		syscall
	li $v0,10 	#syscall-10-exit
		syscall
volume:
	move $t1,$ra #$t1=$ra;				//saving main function return address 
	jal cube 	#jumping to the label cube and saving return address to $ra register
	mul.s $f3,$f1,$f2					#$f3=$f1*$f2;
	mul.s $f3,$f3,$f5					#$f3=$f3*$f5;
	move $ra,$t1 #$ra=$t1;				//getting main function return address 
	jr $ra 	#returns to the next line of function call
cube:
	mul.s $f5,$f0,$f0					#$f5=$f0*$f0;
	mul.s $f5,$f5,$f0					#$f5=$f5*$f0;
	jr $ra 	#returns to the next line of function call
surfaceArea:
	move $t1,$ra #$t1=$ra;				//saving main function return address 
	jal square #jumping to the label square and saving return address to $ra registe
	mul.s $f4,$f1,$f7					#$f4=$f1*$f7;
	mul.s $f4,$f4,$f6					#$f4=$f4*$f6;
	move $ra,$t1 #$ra=$t1;				//getting main function return address 
	jr $ra 	#returns to the next line of function call
square:
	mul.s $f6,$f0,$f0					#$f6=$f0*$f0;
	jr $ra 	#returns to the next line of function call

