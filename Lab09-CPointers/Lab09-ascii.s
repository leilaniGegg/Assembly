    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		lo2up
    .thumb_func
    .align
lo2up:
// Complete this function with your assembly code
    MOV r3, #0
    loop1:
        LDRB r1, [r0, r3]
        CMP r1, #0
        beq end1

        //check for special character
        CMP r1, #97
        blo special1
        CMP r1, #122 
        bhi special1
    
        EOR r2, r1, #0b00100000
        STRB r2, [r0, r3]
        ADD r3, #1                  //increment to next element
        b loop1
    
    bx lr
    special1:
        ADD r3, #1
        b loop1
    end1:
        bx lr

	.global		up2lo
    .thumb_func
    .align
up2lo:
// Complete this function with your assembly code
    MOV r3, #0
    loop2:
        LDRB r1, [r0, r3]
        CMP r1, #0
        beq end2

        //check for special character
        CMP r1, #65
        blo special2
        CMP r1, #90 
        bhi special2
    
        ORR r2, r1, #0b00100000
        STRB r2, [r0, r3]
        ADD r3, #1                  //increment to next element
        b loop2
     bx lr
    special2:
        ADD r3, #1
        b loop2
    end2:
        bx lr
    
	.global		findchr
    .thumb_func
    .align
findchr:
// Complete this function with your assembly code
    MOV r3, #0
    loop3:
        LDRB r2, [r0, r3]
        CMP r2, #0
        beq end3

        CMP r2, r1
        beq found
        ADD r3, #1                  //increment to next element
        b loop3

    bx lr
    found:
        ADD r0, r3
        bx lr
    end3:
        MOV r0, #0
        bx lr

	.end
