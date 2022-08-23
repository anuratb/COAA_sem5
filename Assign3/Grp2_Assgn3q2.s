##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 2  (Print kth largest number)
# Group 2
############################################################

    .globl  main
    .data
prompt1: 
    .asciiz "Enter the value of k: "
prompt2:
    .asciiz "Enter the elements(10): \n"
res:
    .asciiz "kth element of the array is: "
spc:
    .asciiz " "
endl:
    .asciiz "\n"
invalid:
    .asciiz "Invalid Input\n"
    .text

#leaf function no need to store ra
sort_array:
    #$a0 : n
    #$a1 : arr
    addi    $sp,$sp,-8
    sw      $s0 , 0($sp)
    sw      $s1,  4($sp)   
    move    $s0,$a0
    move    $s1,$a1    
    #for j= 1;j<n;j++
    #$t0 : j
    li      $t0, 1 #initialize
Loop1:    
    beq     $t0,$s0,EndLoop1
    #Loop1 body
    mul     $t1,$t0,4  
    add     $t1,$s1,$t1
    lw      $t2, ($t1)   #t2(temp) = arr[j]
    addi    $t1,$t0,-1    #t1(i)  = j-1
    #while i>=0 && arr[i]>temp
Loop2:
    beq     $t1,-1,EndLoop2
    mul     $t3,$t1,4
    add     $t3,$a1,$t3   #t3 = &arr[i]
    lw      $t5,($t3)     #t5 = arr[i]
    slt     $t4,$t2,$t5  #t4 = temp<arr[i]
    bne     $t4,1,EndLoop2   #if not true break
    sw      $t5,4($t3)  #arr[i+1] = arr[i]
    addi    $t1,$t1,-1
    j		Loop2				# jump to Loop2    
EndLoop2:
    addi    $t1,$t1,1  #i = i+1
    mul     $t1,$t1,4
    add     $t1,$s1,$t1
    sw      $t2,($t1)#arr[i+1] = temp
    addi    $t0,$t0,1#j++
    j		Loop1				# jump to Loop1
    
EndLoop1:
    #Print Sorted array
    li      $t0,0
PrintLoop:
    beq     $t0,$s0,PrintLoopEnd
    li      $v0,1
    mul     $t1,$t0,4
    add     $t1,$t1,$s1
    lw      $a0,($t1)
    syscall
    li      $v0,4
    la      $a0,spc
    syscall
    addi    $t0,$t0,1
    j		PrintLoop				
    
PrintLoopEnd:
    #print newline
    li      $v0,4
    la      $a0,endl
    syscall
    # Restore saved values    
    lw      $s1, 4($sp)
    lw      $s0, 0($sp)
    addi    $sp,$sp, 8    #pop stack
    jr      $ra


#***********MAIN************************** 
main:
    
    li      $s0,10          #number of elements
    mul     $t0,$s0,-4      #corresponding offset 
    add     $sp,$sp,$t0     #Allocate array memory
    move    $s1,$sp         #save array begin

    
    li      $v0,4
    la      $a0,prompt2
    syscall
    #input of the array
    #for int t0 = 0;t0!=n;t0++
    li		$t0,0 		    
Loop0:    
    beq     $t0, $s0,EndLoop0
    mul     $t1,$t0,4
    add     $t1,$t1,$s1
    li      $v0,5
    syscall
    sw      $v0,($t1)
    addi	$t0, $t0, 1			#increment t0
    j		Loop0				# jump to target
EndLoop0:
    
    #input k
    li      $v0,4
    la      $a0,prompt1
    syscall
    li      $v0,5
    syscall
    add     $s2,$v0,-1      #store k in 0 indexed form
    slt     $t0,$s2,$s0
    bne     $t0,1,Invalid
    li      $t1,-1
    slt     $t0,$t1,$s2  #if -1<K that is 0<=k
    bne     $t0,1,Invalid
    move    $a0,$s0
    move    $a1,$s1
    jal		sort_array				# jump to sort and save position to $ra

    #Outputting Result
    la      $a0,res
    li      $v0,4
    syscall
    mul     $t0,$s2,4
    add     $t0,$s1,$t0     #t0 = &arr[k]
    lw      $a0,($t0)       #Load ans to a0
    li      $v0,1           #print ans
    syscall
    #restore stack
    mul     $s0,$s0,4#n = n*4
    add     $sp,$sp,$s0
Exit: 
    li      $v0,10  #terminate
    syscall

Invalid:
    li      $v0 ,4
    la      $a0 ,invalid
    syscall
    j Exit



