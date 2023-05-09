		.syntax     unified
		.cpu        cortex-m4

		.text
		.global		func
		.thumb_func
		.align
func:					// Function entry point
		//	Add your assembly code here
		LDR r1, =#0xD0000000
		LDR r3, [r1]   //the graphics memory thing
		SVC #0
		LDR r2, =#0x23410 //offset
		SVC #0
		LDR r0, [r1,r2]
		SVC #0
		LDR r4, =#0xFFFF0000  //red
		.rept 500
			STR r4, [r1,r2]
			ADD r2, #0x3C0  
		.endr

		bx	lr			// Function return

		.end
