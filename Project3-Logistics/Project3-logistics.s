		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		map
		.thumb_func
		.align
map:
//              Write code here for the map function
		//S0 = r
		//S1 = 0.25  (x0)
		//R0 = x*          (pointer to start of float x array)
		//R1 = NUM_POINTS
		
		MOV r2, #0
		VMOV s3, #1

		loop:
			VMUL.F32 s2, s0, s1
			VSUB.F32 s1, s3, s1
			VMUL.F32 s1, s2        //s1 = x[i+1]
			ADD r2, #1
			CMP r2, #100
			BLT loop         //not sure
		
		MOV r2, #0
		
		loop2:
			VMUL.F32 s2, s0, s1
			VSUB.F32 s1, s3, s1
			VMUL.F32 s1, s2        //s1 = x[i+1]
			VSTR s1, [r0]
			ADD r0, #4
			ADD r2, #1
			CMP r2, r1
			BLT loop2         

		bx	lr

		.end