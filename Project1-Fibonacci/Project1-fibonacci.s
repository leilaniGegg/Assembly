		.syntax     unified
		.cpu        cortex-m4

		.bss
//		Write code here for the data words in the .bss section
//		to be initialized to zero
		status: .word 0
		num1: .word 0
		num2: .word 0

		.text
		.global		init_fibonacci
		.thumb_func
		.align
init_fibonacci:
//		Write code here for the init_fibonacci function
		LDR r0, =status
		MOV r1, #0
		STR r1, [r0]
		LDR r0, =num1
		MOV r1, #0
		STR r1, [r0]
		LDR r0, =num2
		MOV r1, #1
		STR r1, [r0]
		bx	lr

		.global		fibonacci
		.thumb_func
		.align
fibonacci:
//		Write code here for the fibonacci function
		LDR r1, =status
		LDR r2, [r1]       //r2 is status
		CMP r2, #1
		ITTT   LO          //if the status is 0
		MOVLO r0, #0
		MOVLO r2, #1
		STRLO r2, [r1]
		blo end
		ITTT   EQ          //if the status is 1
		MOVEQ r0, #1
		MOVEQ r2, #2
		STREQ r2, [r1]
		beq end
		ITTTT  HI          //if the status is 2
		LDRHI r1, =num1
		LDRHI r0, [r1]     //r0 is now num1
		LDRHI r2, =num2
		LDRHI r3, [r2]     //r3 is now num2
		
		IT HI              
		ADDSHI r0, r3      //r0 is now the new num
		BCC nocarry
		LDR r0, =#0xFFFFFFFF

	nocarry:
		//make num1 = num2 and make num2 = r0
		STR r3, [r1]    //stores r3(num2) in r1 (num1)
		STR r0, [r2]    //stores r0(new num) in r3 (num2)
		
	end:

		bx  lr
		
		.end
