// Follows the integer arithmetic algorithm at
// https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
		.syntax     unified
		.cpu        cortex-m4

		.text
		.global		bresenham
		.thumb_func
		.align


		//r0 = x0   col
		//r1 = y0   row
		//r2 = x1
		//r3 = y1
bresenham:
//              Write code here for the bresenham function
		push {r4-r11}
		LDR r12, =#0xD0000000   
		LDR r11, =#0xFF000080  

		SUB r4, r2, r0    // dx
		SUB r5, r3, r1    // dy
		MOV r6, #2
		MUL r6, r5        //2*dy
		SUB r6, r4        //2*dy-dx = D
		MOV r7, r1        //y = y0
		//for x from x0 to x1
		MOV r8, r0        //x = x0
		loop:
			// (y*240) + x  ~ (row * 240) + x
			MOV r10, #240
			MUL r10, r7   //y * 240 -> y
			ADD r10, r8   //r10 is i
			STR r11, [r12, r10, LSL #2] 
			CMP r6, #0
			bgt higher      //D > 0
			ble lower      //D <= 0
			
			higher:
				ADD r7, #1
				//D - 2*dx
				MOV r10, #2
				MUL r10, r4
				SUB r6, r10
			
			lower:
				//D + 2*dy
				MOV r10, #2
				MUL r10, r5
				ADD r6, r10

			ADD r8, #1
			CMP r8, r2
			ble loop
	
		pop {r4-r11}
		bx lr
		.end
