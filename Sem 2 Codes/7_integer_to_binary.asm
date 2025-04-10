.data
    prompt:    .asciiz "Enter an integer: "     # Define string for input prompt
    result:    .asciiz "Binary representation: " # Define string for output label
    newline:   .asciiz "\n"                     # Define string for newline character
    binary:    .space 33 # Reserve 33 bytes (32 bits + null terminator) for binary string

.text
    main:                # Main program label
        # Print prompt
        li $v0, 4        # Load immediate: set system call code 4 (print string)
        la $a0, prompt   # Load address: put address of prompt string in $a0
        syscall          # Execute system call to print prompt

        # Read integer
        li $v0, 5        # Load immediate: set system call code 5 (read integer)
        syscall          # Execute system call to read user input
        move $t0, $v0    # Move: copy input from $v0 to $t0 for processing

        # Prepare for conversion
        li $t1, 31       # Load immediate: set bit position counter to 31 (MSB)
        la $t2, binary   # Load address: put address of binary string in $t2

    convert_loop:        # Label for conversion loop
        # Get current bit
        srlv $t3, $t0, $t1                      # Shift right logical variable: shift $t0 right by $t1 bits, store in $t3
        andi $t3, $t3, 1 # AND immediate: mask all but least significant bit (0 or 1)
        addiu $t3, $t3, 48                      # Add immediate unsigned: convert bit to ASCII ('0'=48, '1'=49)
        sb $t3, 0($t2)   # Store byte: save ASCII character at current position in binary string

        # Move to next position
        addiu $t2, $t2, 1                       # Add immediate unsigned: increment string pointer by 1 byte
        addiu $t1, $t1, -1                      # Add immediate unsigned: decrement bit counter by 1

        # Check if we should continue
        bge $t1, $zero, convert_loop            # Branch if greater or equal: loop if $t1 >= 0

        # Add null terminator
        sb $zero, 0($t2) # Store byte: put null terminator (0) at end of string

        # Print result message
        li $v0, 4        # Load immediate: set system call code 4 (print string)
        la $a0, result   # Load address: put address of result string in $a0
        syscall          # Execute system call to print result label

        # Print binary string
        li $v0, 4        # Load immediate: set system call code 4 (print string)
        la $a0, binary   # Load address: put address of binary string in $a0
        syscall          # Execute system call to print binary representation

        # Print newline
        li $v0, 4        # Load immediate: set system call code 4 (print string)
        la $a0, newline  # Load address: put address of newline string in $a0
        syscall          # Execute system call to print newline

        # Exit program
        li $v0, 10       # Load immediate: set system call code 10 (exit)
        syscall          # Execute system call to terminate program
