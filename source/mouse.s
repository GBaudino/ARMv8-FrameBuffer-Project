.include "data.s"
.include "utilities.s"

.globl createMouseCave
createMouseCave:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
		// - x0: 	Color of Base
		// - x5:	Variacion tamano

	// Temporary values:
		// - x9:	Temp cantidad de ejecuciones del loop

	mov x1, 379
	mov x2, 120
	add x2, x2, x5
	mov x3, 18
	sub x3, x3, x5
	mov x4, 16
	sub x4, x4, x5
	bl createVRectangle

	mov x3, 1
	mov x9, 4
	loopMouseCave:
		sub x1, x1, 1
		add x2, x2, 1
		sub x4, x4, 2
		bl createVRectangle
		sub x9, x9, 1
		cbnz x9, loopMouseCave

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createMouseEyes
createMouseEyes:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp] 

	ldr x0, mouse_eyes
	mov x1, 384
	mov x2, 124
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	mov x2, 129
	bl createVRectangle

	ldr x0, red
	mov x1, 386
	mov x2, 125
	mov x3, 2
	mov x4, 2
	bl createVRectangle

	mov x2, 130
	bl createVRectangle

	//Carga del registro de return y devolucion del siguiente
	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl generateMouseBlinking
generateMouseBlinking:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
		// - x5: 	Variación Y
	
    ldr x0, black
    mov x1, 384
    add x1, x1, x5
    mov x2, 124
    mov x4, 3
    bl createHLine


    mov x2, 129
    bl createHLine

    ldr x7, delay_mouse_long
    bl delay

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl mouseBlinking
mouseBlinking:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]
	
    mov x5,0
	repBlinking:
        bl generateMouseBlinking
        ldr x7, delay_mouse_blinking
        bl delay
        add x5 , x5, 1
        cmp x5, 4
        bne repBlinking
    
    ldr x7, delay_mouse_longlong
    bl delay
	
    bl createMouseEyes

	ldr x7, delay_mouse_pause
    bl delay

	ldr x30, [sp]
	add sp, sp, 8
	br x30
