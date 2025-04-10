.data
    prompt:    .asciiz "Enter an integer: "     # Define string for input prompt
    result:    .asciiz "Number of 1's: "        # Define string for output label
    newline:   .asciiz "\n"                     # Define string for newline character

.text
    main:
        # Print prompt
        li $v0, 4          # Load immediate: set system call code 4 (print string)
        la $a0, prompt     # Load address: put address of prompt string in $a0
        syscall            # Execute system call to print prompt

        # Read integer
        li $v0, 5          # Load immediate: set system call code 5 (read integer)
        syscall            # Execute system call to read user input
        move $t0, $v0      # Move: copy input from $v0 to $t0 for processing

        # Prepare for counting
        li $t1, 31         # Load immediate: set bit position counter to 31 (MSB)
        li $t2, 0          # Load immediate: initialize count of 1's to 0

    count_loop:
        # Get current bit
        srlv $t3, $t0, $t1 # Shift right logical variable: shift $t0 right by $t1 bits, store in $t3
        andi $t3, $t3, 1   # AND immediate: mask all but least significant bit (0 or 1)
        addu $t2, $t2, $t3 # Add unsigned: add bit value (0 or 1) to running count

        # Move to next bit
        addiu $t1, $t1, -1 # Add immediate unsigned: decrement bit counter by 1

        # Check if we should continue
        bge $t1, $zero, count_loop              # Branch if greater or equal: loop if $t1 >= 0

        # Print result message
        li $v0, 4          # Load immediate: set system call code 4 (print string)
        la $a0, result     # Load address: put address of result string in $a0
        syscall            # Execute system call to print result label

        # Print count
        li $v0, 1          # Load immediate: set system call code 1 (print integer)
        move $a0, $t2      # Move: put count from $t2 into $a0 for printing
        syscall            # Execute system call to print number of 1's

        # Print newline
        li $v0, 4          # Load immediate: set system call code 4 (print string)
        la $a0, newline    # Load address: put address of newline string in $a0
        syscall            # Execute system call to print newline

        # Exit program
        li $v0, 10         # Load immediate: set system call code 10 (exit)
        syscall            # Execute system call to terminate program

