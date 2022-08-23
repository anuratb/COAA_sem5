
##################### ASSIGNMENT 3 #########################
# Semester 5 Autumn 2021                                    
# Question 2   (recursive quick sort with left point as pivot)
# Group 2(19CS10071(Anurat Bhattacharya) ,  19CS10060(Sunanda Mandal))
############################################################


.globl  main
    .data
prompt1:
    .asciiz "Enter the elements(10): \n"
SortedArray:
    .asciiz "The sorted array is : "
endl:
    .asciiz "\n"
space:
    .asciiz " " 

    .text


initStack:
    addi    $sp,$sp,-4
    sw		$fp, 0($sp)		
    move    $fp,$sp
    jr      $ra

pushToStack:
    addi    $sp,$sp,-4    
    sw      $a0,0($sp)
    move    $v0,$sp
    jr      $ra


printArray:
    addi    $sp,$sp,-8
    sw      $s0,($sp)    #arr
    sw      $s1,4($sp)   #n
    move    $s0,$a0
    move    $s1,$a1
    #Outputting Result
    la      $a0,SortedArray
    li      $v0,4
    syscall

    #output of the array
    #for int t0 = 0;t0!=n;t0++
    li      $t0,0 

OutLoop:    
    beq     $t0, $s1,EndOutLoop
    mul     $t1,$t0,4
    add     $t1,$t1,$s0
    li      $v0,1
    lw      $a0,($t1)    #print current elem
    syscall    
    li      $v0,4
    la      $a0,space    #print spaces
    syscall
    addi    $t0, $t0, 1         #increment t0
    j       OutLoop               # jump to target

EndOutLoop:
    lw      $s1,4($sp)
    lw      $s0,($sp)
    addi    $sp,$sp,8
    jr     $ra
#leaf function no need to store in stack
swap:
#  a0 : arr
#  a1 : i
#  a2 : j   ==> Swap arr[i] and arr[j]
    addi    $sp,$sp,-12
    sw      $s0,($sp)
    sw      $s1,4($sp)
    sw      $s2,8($sp)

    sll     $s0, $a1, 2             # $s0 = i*4
    add     $s0, $a0, $s0           # $s0 = &arr[i]
    sll     $s1, $a2, 2             # $s1 = j*4
    add     $s1, $a0, $s1           # $s1 = &arr[j]
    lw      $s2,($s1)      #s2 = arr[j]
    lw      $t6,($s0)      #t6  =arr[i]
    sw      $s2,($s0)     #arr[i] = arr[j] value     
    sw      $t6,($s1)     #arr[j] = arr[i] value

    lw      $s2,8($sp)
    lw      $s1,4($sp)
    lw      $s0,0($sp)
    addi    $sp,$sp,12
    jr      $ra 


recursive_sort:
    #a0 : arr  (s0)
    #a1 : left (s1)
    #a2 : right (s2)

    #s3 : p  
    #s4 : l  
    #s5 : r  

    add     $sp, $sp, -28
    sw      $ra,0($sp)
    sw      $s0,4($sp)      
    sw      $s1,8($sp)
    sw      $s2,12($sp)
    sw      $s3,16($sp)
    sw      $s4,20($sp)
    sw      $s5,24($sp)

    move $s0,$a0
    move $s1,$a1
    move $s2,$a2
    move $s3, $s1                   # p=left  
    move $s4, $s1                   # l 
    move $s5, $s2                   # r

While:
    bge $s4, $s5 , RetFunction     #l<r    

InnerWhile1:
    bge $s4,$s2,InnerWhile2    #if l>=r goto next while loop

    sll $t3, $s3, 2                 # $t3 = p * 4
    add $t3, $s0, $t3               # $t3 = arr+(p*4) (address of arr[p])
    lw $t3, 0($t3)                  # $t3 = arr[p]
    sll $t4, $s4, 2                 # $t4 = l * 4
    add $t4, $s0, $t4               # $t4 = arr+(l*4) (address of arr[l])
    lw $t4, 0($t4)                  # $t4 = arr[l]
    bgt $t4,$t3,InnerWhile2

    addi $s4, $s4, 1                #l++
    j InnerWhile1    #Till this --ok

InnerWhile2:
    ble $s5,$s1,IfCondition     #if r<=left break to IfCondition
    

    sll $t3, $s3, 2                 # $t3 = p * 4
    add $t3, $s0, $t3               # $t3 = arr+(p*4) (address of arr[p])
    lw $t3, 0($t3)                  # $t3 = arr[p]
    sll $t4, $s5, 2                 # $t4 = r * 4
    add $t4, $s0, $t4               # $t4 = arr+(r*4) (address of arr[r])
    lw $t4, 0($t4)                  # $t4 = arr[r]
    blt $t4,$t3,IfCondition   

    addi $s5, $s5, -1               #r--
    j InnerWhile2        #Til this  --ok
IfCondition:
    blt $s4,$s5,EndIf  #if l<r goto endif
    
    move $a0, $s0
    move $a1, $s3
    move $a2, $s5
    jal swap                    # swap arr[p] and arr[r]
    #call recursive_sort on left part
    move $a0, $s0
    move $a1, $s1               # left
    addi $a2, $s5, -1           # r-1    
    jal recursive_sort
    #call recursive_sort on right part
    move $a0, $s0
    addi $a1, $s5, 1            # r+1
    move $a2, $s2               # right
    jal recursive_sort
    j    RetFunction   #return 

EndIf:
    move $a0, $s0
    move $a1, $s4
    move $a2, $s5
    jal swap                    # swap arr[l] and arr[r]
    j  While

RetFunction:
    lw      $s5,24($sp)
    lw      $s4,20($sp)
    lw      $s3,16($sp)
    lw      $s2, 12($sp)        
    lw      $s1, 8($sp)
    lw      $s0,4($sp)
    lw      $ra ,0($sp)
    addi    $sp,$sp,28
    jr      $ra


	

main:
    
    jal     initStack
    li      $s0,10          #number of elements
    mul     $t0,$s0,-4      #corresponding offset 
    add     $sp,$sp,$t0     #Allocate array memory
    move    $s1,$sp         #save array begin

    
    li      $v0,4
    la      $a0,prompt1
    syscall
    #input of the array
    #for int t0 = 0;t0!=n;t0++
    li		$t0,0 	

InLoop:    
    beq     $t0, $s0,EndInLoop
    mul     $t1, $t0, 4
    add     $t1, $t1, $s1
    li      $v0,5
    syscall
    sw      $v0,($t1)
    addi	$t0, $t0, 1			#increment t0


    j		InLoop				# jump to target

EndInLoop:
    move    $a0,$s1                #arr
    li      $a1,0                  #l = 0
    sub     $a2,$s0,1              #r = n-1
    jal		recursive_sort				# jump to sort and save position to $ra

    #print sorted array 
    move    $a0,$s1
    move    $a1,$s0
    jal     printArray

    
Exit: 
    #restore stack
    move    $sp,$fp
    lw      $fp,($sp)
    addi    $sp,$sp,4
    
    li      $v0,10  #terminate the program
    syscall
