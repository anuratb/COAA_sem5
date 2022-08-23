##################### ASSIGNMENT 2 #########################
# Semester 5 Autumn 2021                                    
# Question 3
# Anurat Bhattacharya(19CS10071)
# Sunanda Mandal(19CS10060)
############################################################


    .globl main

    .data
prompt1:
    .asciiz "Enter a positive integer greater than equals to 10: "
prompt2:
    .asciiz "Invalid Input Exitting...\n"
isPrime:
    .asciiz "Entered number is a PRIME number\n"
notPrime:
    .asciiz "Entered number is a COMPOSITE  number\n"
    


    .text


# main program
#
# program variables
#   n:   $t0
#   i:   $t1
#

main:

    li		$v0, 4		        # $v0 =4 for printing string prompt1
    la		$a0, prompt1		
    syscall

    li		$v0, 5		        # read n from user
    syscall

    slti    $t0,$v0,10          # sanity checking
    beq		$t0, 1, Exit	    # if $v0<=10 (i.e. n<=10)  Exit:target
    move $t0 , $v0              # t0 now contains n

    #initialize loop for checking primality
    #t1 ==> i
    li    $t1, 2                #initialize with 2

Loop:
    mult	$t1, $t1			# $t1 * $t1 = Hi and Lo registers
    mflo	$t2					# copy Lo to $t2
    mfhi    $t3                 # copy Hi to $t3
    bne     $t3 , $zero, Prime  # if overflow is non zero i*i>n , so n prime
    slt     $t4 , $t0,$t2       # check if n<i*i
    beq     $t4 , 1, Prime      # n is prime

    #check divisibility
    div		$t0, $t1			# $t0 / $t1
    mflo	$t2					# $t2 = floor($t0 / $t1) 
    mfhi	$t3					# $t3 = $t0 mod $t1 
    beq     $t3 , $zero , NotPrime  # not prime if remainder is 0 that is i divides n
    addi    $t1 , 1             # increment i
    j Loop                      # Continue loop
    

NotPrime:
    li      $v0 ,4              # Print that n is composite
    la      $a0 ,notPrime
    syscall
    li      $v0, 10             # terminate the program
    syscall

Prime:
    li      $v0 ,4              # Print that n is prime
    la      $a0 ,isPrime
    syscall
    li      $v0, 10             # terminate the program
    syscall

Exit:
    li      $v0 ,4              # if n<=10 print invalid input and exit
    la      $a0 ,prompt2
    syscall
    li      $v0, 10             # terminate the program
    syscall
    
  
    
    
    