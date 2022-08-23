##################### ASSIGNMENT 2 #########################
# Semester 5 Autumn 2021                                    
# Question 4
# Anurat Bhattacharya(19CS10071)
# Sunanda Mandal(19CS10060)
############################################################


    .globl main

    .data
prompt1:
    .asciiz "Enter a positive integer : "
prompt2:
    .asciiz "Invalid Input Exitting...\n"
isPerfect:
    .asciiz "The number is a perfect number \n"
notPerfect:
    .asciiz "The number is not a perfect number\n"
    


    .text

# main program
#
# program variables
#   n:   $t0
#   sum: $t5
#   i:   $t1
#

main:

    li		$v0, 4		                # printing prompt1 n the console
    la		$a0, prompt1		
    syscall
    li		$v0, 5		                # read number n
    syscall
    slt     $t0, $zero ,$v0             # sanity checking
    beq		$t0, $zero, InvalidInput	# if $v0<=0  Invalid Input
    move $t0 , $v0                      # t0 now contains n

    # initialize loop for checking divisors
    li    $t1, 2                        # initialize with 2
    li    $t5, 1                        # sum of proper factors initialized with 1

Loop:
    mult	$t1, $t1			        # $t1 * $t1 = Hi and Lo registers
    mflo	$t2					        # copy Lo to $t2
    mfhi    $t3                         # copy Hi to $t3
    bne     $t3 , $zero, ChkPerfect     # if overflow is non zero i*i>n , so the loop is complete
    slt     $t4 , $t0,$t2               # check if n<i*i
    beq     $t4 , 1, ChkPerfect         # Test if loop is complete then check if n == sum of factores that is $t5

    #check divisibbility
    div		$t0, $t1			        # $t0 / $t1 (n/i)
    mflo	$t2					        # $t2 = floor($t0 / $t1) 
    mfhi	$t3					        # $t3 = $t0 mod $t1 
    beq     $t3 , $zero , UpdateFactorSum  # i is factor of n if remainder is 0 so add i and (n/i) to sum of factors

ContinueLoop:
    addi    $t1 , 1                     # increment i by 1
    j Loop

UpdateFactorSum:
    add     $t5 , $t5, $t1              # add i
    beq     $t1 , $t2, ContinueLoop     # if perfect square add only once (i==n/i)
    add     $t5, $t5, $t2               # add (n/i)
    j ContinueLoop

ChkPerfect:
    beq     $t5 , $t0, Perfect          # if sum is equal go to outputting isPerfect    

NotPerfect:                             # print that n is not Perfect
    li      $v0 ,4
    la      $a0 ,notPerfect
    syscall
    j Exit

Perfect:                                # print that n is Perfect
    li      $v0 ,4
    la      $a0 ,isPerfect
    syscall
    j Exit

Exit:    
    li      $v0, 10                     # terminate the program
    syscall

InvalidInput:
    li      $v0 ,4
    la      $a0 ,prompt2
    syscall
    j Exit                              # Exit the program
    

    