		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		determinant
		.thumb_func
		.align
determinant:
// Complete this function with your assembly code
		VLDR 		S0, [R0]     //a11
		ADD R0, #4
		VLDR 		S1, [R0]     //a12
		ADD R0, #4
		VLDR 		S2, [R0]     //a21
		ADD R0, #4
		VLDR 		S3, [R0]	 //a22

		VMUL.F32 	S4, S0, S3	 	//a11*a22
		VMUL.F32 	S5, S1, S2	 	//a12*a21
		VSUB.F32 	S6, S4, S5		//a11*a22 - a12*a21
		VMOV 		S0, S6
		bx	lr
		.end