.text
.global main

main:
  
  li $v0,100
  syscall
  li $s0,0
  li $s1,0
  
  Game_Loop:
    li $a0,0x000000
    li $v0,103  ;hacemos clear
    syscall
    
    li $v0,104 ; obtenemos la tecla
    syscall
    
    move $t0,$v0
    li $t2,5
    beq $t0,$t2,end_game ; si es 5 salta
    
    li $t2,1
    beq $t0,$t2,UP 
    
    li $t2,2
    beq $t0,$t2,DOWN
    
    li $t2,3
    beq $t0,$t2,LEFT
    
    li $t2,4
    beq $t0,$t2,RIGHT
    j Draw
    UP:
      addi $s0,$s0,-1
      j Draw
    DOWN:
      addi $s0,$s0,1
      j Draw
    RIGHT:
      addi $s1,$s1,1
      j Draw
    LEFT:
      addi $s1,$s1,-1
      j Draw
    
    Draw:
      move $a0,$s1 ;t4=x
      move $a1,$s0 ;t3=y
      li $a2,5
      li $a3,5
      jal draw_rectangle
    
      li $v0,102
      syscall
    
      j Game_Loop
  
  end_game:
    li $v0,105
    syscall
    jr $ra

draw_horizontal_line:
  move $t0,$a0 ;#x
  move $t1,$a1 ;#x2
  move $t2,$a2 ;#y
  move $t3,$a3 ;#color
   addi $t1,$t1,1
for_loop:
  slt $t4,$t0,$t1
  beq $t4,$zero,end_loop
  move $a0,$t0
  move $a1,$t2
  move $a2,$t3
  li $v0,101
  syscall
  addi $t0,$t0,1
  j for_loop
end_loop:
  jr $ra

draw_rectangle:
    li $t0,0  ;#dy
    move $t2,$a2 ;# t2=w
    move $t3,$a3 ;# t3=h
    move $t4,$a1 ;# t4=y
    move $t5,$a0 ;# t5=x
    loop_y:
       slt $t6,$t0,$t3
       beq $t6,$zero,end
       li $t6,0 ;#dx
       loop_x:
         slt $t7,$t6,$t2
         beq $t7,$zero,end_x
         add $t7,$t5,$t6
         add $t8,$t4,$t0
         move $a0,$t7
         move $a1,$t8
         li $a2,0x00FF00
         li $v0,101
         syscall
         addi $t6,$t6,1
         j loop_x
    end_x:
    addi $t0,$t0,1
    j loop_y
    end:
     jr $ra
