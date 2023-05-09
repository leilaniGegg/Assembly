//
// User LD3: The green LED is a user LED connected to the I/O PG13 of the STM32F429ZIT6.
// User LD4: The red LED is a user LED connected to the I/O PG14 of the STM32F429ZIT6.
//

	.syntax     unified
	.cpu        cortex-m4
	.equ RCC_AHB1ENR, 0x40023830
    .equ GPIOG_MODER, 0x40021800
    .equ GPIOG_OTYPER,0x40021804
    .equ GPIOG_OSPEEDR,0x40021808
    .equ GPIOG_IDR,   0x40021810
    .equ GPIOG_ODR,   0x40021814

	.text

//
// Function to set up bits 14 and 13 of the GPIO port G to drive the
// red and green user LEDs. The bits are set to general purpose output
// mode with high speed. There are no arguments or a return value.
//
	.global		setupLEDs
	.thumb_func
	.align
setupLEDs:
// Complete your assembly code here
	ldr r0, =RCC_AHB1ENR
	ldr r1, [r0]
	orr r1, r1, #0x40         //orr with 0x40 to set 6th bit (GPIOGEN) to 1
	str r1, [r0]
	ldr r0, =GPIOG_MODER
	ldr r1, [r0]
	bic r1, #0x28000000 // making 26 1 and 27 0
	orr r1, #0x14000000 // making 28 1 and 27 1
	str r1, [r0]
	ldr r0, =GPIOG_OSPEEDR
	ldr r1, [r0]
	orr r1, #0x3C000000  //making bits 26-29 1
	str r1, [r0]
	bx	lr

//
// Function to set the state of the two user LEDs. There are
// two uint32_t arguments expected. The first argument controls
// the red LED on bit 14 of GPIO port G, and the second argument
// controls the green LED on bit 13 of GPIO port G. Each argument
// may be 0 or 1, signifying the corresponding LED is turned on
// or off, respectively. There is no return value.
//
	.global		setLEDs
	.thumb_func
	.align

setLEDs:
// Complete your assembly code here
	//r0 is red status, r1 is green status
	ldr r2, =GPIOG_ODR
	ldr r3, [r2]
	//green 
	cmp r1, #0x1
	beq greenOn
	bic r3, #0x2000
	b greenOff
greenOn:
	orr r3, r3, #0x2000
greenOff:
	//red
	cmp r0, #0x1
	beq redOn
	bic r3, #0x4000
	b redOff
redOn:
	orr r3, #0x4000
redOff:
	str r3, [r2]
	bx lr

	.end
