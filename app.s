
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGHT, 	480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	bl config

	bl static

	movz x7, 0xf200, lsl 16
	movk x7, 0x4000, lsl 0
	bl delay

	b dynamic


config:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
		// the function does not receive any value

	//Set saved values
 	mov x20, x0	            // Save framebuffer base address to x20
    mov x21, SCREEN_WIDTH   // Save Screen Width
    mov x22, SCREEN_HEIGHT  // Save Screen Height

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


delay:
    //Guardado registro return
    sub sp, sp, 16
	str x30, [sp]

    // Input values:
        // - x7: Limit to repeat

    cont:
        sub x7, x7, 1
        cbnz x7, cont

    ldr x30, [sp]
	add sp, sp, 16
    ret


createRectangle:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	// Input values:
	    // - x0:    Color Base
        // - x1:    Coord primero en y
        // - x2:    Coord primero en x
        // - x3:    Alto del rectangulo
        // - x4:    Ancho del rectangulo

    //Temporary values:
		// - x9: 	Temp Base Address of Rectangle
		// - x10:	Temp Calc of sum of memory needed for the next row
		// - x11: 	Temp actual row
		// - x12: 	Temp actual column

	//Saved values used:
		// - x20:	Framebuffer Base Address
		// - x21:	Screen Width
		// - x22:	Screen Height

	
	//Generacion de la coordenada del primero del cuadrado
	//Coord del pixel = Dirección de inicio + 4 * [x + (y * 640)]
	mul x9, x1, x21 		// (y * 640)
	add x9,x9, x2		// + (Coord del primero en x) = [x + (y * 640)]
	lsl x9, x9, 2 		//(4 * [x + (y * 640)])
	add x9,x9,x20 		// Dirección de inicio + 4 * [x + (y * 640)]


	//Generacion de la cantidad de memoria a correr x9 para llevarlo a la siguiente fila
	//(SCREEN_WIDTH - SQUARE_WIDTH)*4
	mov x10, x21
	sub x10, x10, x4
	lsl x10, x10, 2

	mov x12, x3 //Set Rectangle Height
	resetRectW:
	mov x11, x4 //Set and Reset Rectangle Width
	nxtPixelRect:
		stur w0,[x9]	   	 	// Set color of pixel N
		add x9,x9,4	   			// Next pixel
		sub x11,x11,1	   			// decrement X counter
		cbnz x11,nxtPixelRect   	// If not end row jump
		add x9, x9, x10	 		// Direccion actual + restante para la sig fila = x19 + (SCREEN_WIDTH - FLOOR_WIDTH)*4
		sub x12,x12,1	    	 	// Decrement Y counter
		cbnz x12,resetRectW 		// if not last row, jump
	
	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


createTriangle: 
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp] 

	// Input values:
		// - x0: Color of Triangle
		// - x1: Coord del primero en Y
		// - x2: Coord del primero en X
		// - x3: Alto Escalon
		// - x4: Ancho Escalon
		// - x5: Reduccion Alto Escalon
		// - x6: Reduccion Ancho Escalon
		// - x7: Cantidad de escalones
	
	// Temporary values:
		// - x9: Temp red ancho escalon
	add x9, x6, x6
	loop_Triang2:
		bl createRectangle
		sub x7, x7, 1
		loop_Triang:
			sub x1, x1, x3
			add x1, x1, x5
			add x2, x2, x6
			sub x4, x4, x6
			sub x4, x4, x6
			sub x3, x3, x5
			cbz x7, done
			cmp x4, x9
			blt loop_Triang2
	done:


	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret

createArcade:
//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x001d, lsl 16
	movk x0, 0xe9b6, lsl 0
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 134
	bl createRectangle


	ldr x30, [sp]
	add sp, sp, 16
	ret



createPoster:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x00ba, lsl 16
	movk x0, 0x7404, lsl 0
	mov x1, 90
	mov x2, 470
	mov x3,	117
	mov x4, 125
	bl createRectangle

	movz x0, 0x00ff, lsl 16
	movk x0, 0xc107, lsl 0
	mov x1, 89
	mov x2, 472
	mov x3,	115
	mov x4, 125
	bl createRectangle

	

	ldr x30, [sp]
	add sp, sp, 16
	ret

createMonkey:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 103
	mov x2, 539
	mov x3,	4
	mov x4, 18
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 107
	mov x2, 539
	mov x3,	1
	mov x4, 13
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 108
	mov x2, 534
	mov x3,	5
	mov x4, 18
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 113
	mov x2, 529
	mov x3,	5
	mov x4, 34
	bl createRectangle
	
	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 118
	mov x2, 514
	mov x3,	5
	mov x4, 39
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 123
	mov x2, 509
	mov x3,	5
	mov x4, 29
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 128
	mov x2, 504
	mov x3,	5
	mov x4, 34
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 133
	mov x2, 499
	mov x3,	5
	mov x4, 44
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 138
	mov x2, 499
	mov x3,	5
	mov x4, 39
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 143
	mov x2, 494
	mov x3,	5
	mov x4, 39
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 148
	mov x2, 494
	mov x3,	11
	mov x4, 49
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 159
	mov x2, 488
	mov x3,	15
	mov x4, 50
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 174
	mov x2, 494
	mov x3,	5
	mov x4, 19
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 179
	mov x2, 488
	mov x3,	5
	mov x4, 19
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 174
	mov x2, 519
	mov x3,	5
	mov x4, 19
	bl createRectangle

	movz x0, 0x0070, lsl 16
	movk x0, 0x4d37, lsl 0
	mov x1, 179
	mov x2, 529
	mov x3,	5
	mov x4, 9
	bl createRectangle



	ldr x30, [sp]
	add sp, sp, 16
	ret

createBackground:
	//Guardado registro return
	sub sp, sp, 16
	str x30, [sp]

	movz x0, 0x005f, lsl 16
	movk x0, 0x4d84, lsl 0
	mov x1, 0
	mov x2, 0
	mov x3, 396
	mov x4, x21
	bl createRectangle


	movz x0, 0x0079, lsl 16
	movk x0, 0x5548, lsl 0
	mov x1, 396
	mov x2, 0
	mov x3, 85
	mov x4, x21
	bl createRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 16
	ret


static:
	sub sp, sp, 16
	str x30, [sp]

	bl createBackground
	bl createArcade
	bl createPoster
	bl createMonkey


	ldr x30, [sp]
	add sp, sp, 16
	ret


dynamic:

	b dynamic

