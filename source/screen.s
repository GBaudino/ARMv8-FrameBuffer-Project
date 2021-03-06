.include "data.s"
.include "utilities.s"

.globl resetScreen
resetScreen:
    //Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

    //Creacion parte del vidrio (Verde oscuro)
	ldr x0, screen_off
	
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

    ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl powerOffScreen
powerOffScreen:
    //Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

    bl resetScreen

	//Creacion reflejo del vidrio
	ldr x0,screen_short_reflex
    mov x1, 101
    mov x2, 258
    mov x3, 36
    mov x4, 36
    bl createVRectangle

    //Creacion triangulo reflejo del vidrio
	ldr x0, screen_off
    mov x1, 125
    mov x2, 270
    mov x3, 12
    mov x4, 48
    mov x5, 0
    mov x6, 12
    mov x7, 2
    bl createTriangle

    //Creacion reflejo del vidrio
	ldr x0, screen_large_reflex
    mov x1, 101
    mov x2, 258
    mov x3, 10
    mov x4, 10
    bl createVRectangle

    //Creacion reflejo del vidrio
	ldr x0, screen_short_reflex
    mov x1, 166
    mov x2, 260
    mov x3, 12
    mov x4, 88
    bl createVRectangle

    mov x1, 154
    mov x2, 348
    mov x3, 24
    mov x4, 24
    bl createVRectangle

    mov x1, 115
    mov x2, 360
    mov x3, 39
    mov x4, 12
    bl createVRectangle
	
    ldr x30, [sp]
	add sp, sp, 8
	br x30


screenExpansion:
	sub sp, sp, 8
	str x30, [sp]

	// Input values:
	    // - x0: Color of background
		// - x1: First Y coord for expansion
		// - x2: First X coord for expansion
		// - x3: First height for expansion
		// - x4: First width for expansion
		// - x5: Expansion limit - Factor of 3

	loopScreenExpansion:
		bl createVRectangle
		sub x1, x1, 3
		sub x2, x2, 4
		add x3, x3, 6
		add x4, x4, 8
		cmp x1, x5

		ldr x7, delay_screen_short
        
		bl delay
		bgt loopScreenExpansion


	ldr x30, [sp]
	add sp, sp, 8
	br x30


powerOnEffect:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	ldr x0, white
	mov x1, 129
	mov x2, 301
	mov x3,	20
	mov x4, 27
	mov x5, 89
	bl screenExpansion

	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl powerOnScreen
powerOnScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	bl resetScreen

	ldr x7, delay_screen_short
	bl delay

	bl powerOnEffect

	ldr x30, [sp]
	add sp, sp, 8
	br x30


gradientScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Temporary values
		// - x9:	Temp const for the substraction

	bl saveTempValues

	movz x9, 0x1111, lsl 16
	movk x9, 0x1111, lsl 0

	ldr x0, white
	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	gradient:
		bl createVRectangle
		ldr x7, delay_screen_short
		bl delay
		sub x0, x0, x9
		cmp x0, 0x0
		bge gradient
	
	bl loadTempValues

	ldr x30, [sp]
	add sp, sp, 8
	br x30


donkeySplashScreen:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	ldr x0, dark_brown_donkey
	mov x1, 129
	mov x2, 301
	mov x3,	20
	mov x4, 27
	mov x5, 89
	bl screenExpansion

	mov x1, 89
	mov x2, 247
	mov x3,	100
	mov x4, 135
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30

donkeyFace:
	sub sp, sp, 8
	str x30, [sp]

	//face
	ldr x0, light_pink_donkey
	mov x1, 114
	mov x2, 300
	mov x3, 4
	mov x4, 8
	bl createVRectangle

	mov x2, 322
	bl createVRectangle

	mov x1, 118
	mov x2, 295
	mov x3, 5
	mov x4, 18
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	mov x1, 123
	mov x2, 291
	mov x4, 47
	bl createVRectangle

	mov x1, 128
	mov x2, 295
	mov x3, 8
	mov x4, 39
	bl createVRectangle

	//mouth
	mov x1, 136
	mov x2, 282
	mov x3, 4
	mov x4, 26
	bl createVRectangle

	mov x2, 321
	bl createVRectangle

	mov x1, 140
	mov x2, 278
	mov x3, 5
	mov x4, 73
	bl createVRectangle

	mov x1, 145
	mov x3, 4
	mov x4, 13
	bl createVRectangle

	mov x2, 338
	bl createVRectangle

	mov x1, 149
	mov x2, 278
	mov x3, 5
	mov x4, 9
	bl createVRectangle

	mov x2, 342
	bl createVRectangle

	mov x1, 149
	mov x2, 291
	mov x4, 47
	bl createVRectangle

	mov x1, 154
	mov x2, 287
	mov x3, 8
	mov x4, 55
	bl createVRectangle

	mov x1, 162
	mov x2, 295
	mov x3, 4
	mov x4, 39
	bl createVRectangle

	//hears
	mov x1, 123
	mov x2, 282
	mov x3, 5
	mov x4, 4
	bl createVRectangle

	mov x2, 343
	bl createVRectangle

	mov x1, 128
	mov x2, 278
	mov x3, 8
	mov x4, 8
	bl createVRectangle

	mov x2, 343
	bl createVRectangle

	//eyes
	ldr x0, donkey_white
	mov x1, 123
	mov x2, 304
	mov x3, 9
	mov x4, 9
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	ldr x0, black
	mov x1, 128
	mov x2, 309
	mov x3, 4
	mov x4, 4
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30

donkeyFace2:
	sub sp, sp, 8
	str x30, [sp]

	//face
	ldr x0, light_pink_donkey
	mov x1, 114
	mov x2, 300
	mov x3, 4
	mov x4, 8
	bl createVRectangle

	mov x2, 322
	bl createVRectangle

	mov x1, 118
	mov x2, 295
	mov x3, 5
	mov x4, 18
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	mov x1, 123
	mov x2, 291
	mov x4, 47
	bl createVRectangle

	mov x1, 128
	mov x2, 295
	mov x3, 8
	mov x4, 39
	bl createVRectangle

	//mouth
	mov x1, 136
	mov x2, 279
	mov x3, 5
	mov x4, 29
	bl createVRectangle

	mov x2, 321
	bl createVRectangle

	mov x1, 141
	mov x2, 274
	mov x3, 4
	mov x4, 13
	bl createVRectangle

	mov x2, 296
	bl createVRectangle

	mov x2, 321
	bl createVRectangle

	mov x2, 343
	bl createVRectangle

	mov x1, 140
	mov x2, 308
	mov x3, 5
	mov x4, 13
	bl createVRectangle

	mov x1, 145
	mov x2, 274
	mov x3, 9
	mov x4, 9
	bl createVRectangle

	mov x2, 347
	bl createVRectangle

	mov x1, 154
	mov x2, 279
	mov x3, 4
	mov x4, 8
	bl createVRectangle

	mov x2, 343
	bl createVRectangle

	mov x1, 159
	mov x2, 287
	mov x3, 3
	mov x4, 13
	bl createVRectangle

	mov x2, 330
	bl createVRectangle

	mov x1, 158
	mov x2, 283
	mov x3, 4
	mov x4, 4
	bl createVRectangle

	mov x2, 343
	bl createVRectangle

	mov x1, 162
	mov x2, 296
	mov x3, 5
	mov x4, 38
	bl createVRectangle

	//hears
	mov x1, 124
	mov x2, 274
	mov x3, 4
	mov x4, 9
	bl createVRectangle

	mov x2, 347
	bl createVRectangle

	mov x1, 128
	mov x2, 270
	mov x3, 8
	mov x4, 13
	bl createVRectangle

	mov x2, 347
	bl createVRectangle

	//smile

	ldr x0, donkey_white
	mov x1, 141
	mov x2, 287
	mov x3, 4
	mov x4, 9
	bl createVRectangle

	mov x2, 334
	bl createVRectangle

	mov x1, 145
	mov x2, 283
	mov x3, 5
	mov x4, 13
	bl createVRectangle

	mov x2, 300
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	mov x2, 334
	bl createVRectangle

	mov x1, 150
	mov x2, 287
	mov x3, 9
	mov x4, 4
	bl createVRectangle

	mov x2, 339
	bl createVRectangle

	mov x1, 154
	mov x2, 291
	mov x3, 5
	mov x4, 5
	bl createVRectangle

	mov x2, 334
	bl createVRectangle

	mov x1, 150
	mov x2, 305
	mov x3, 4
	mov x4, 3
	bl createVRectangle

	mov x2, 322
	bl createVRectangle

	mov x1, 154
	mov x2, 300
	mov x3, 8
	mov x4, 13
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	mov x1, 159
	mov x2, 313
	mov x3, 3
	mov x4, 4
	bl createVRectangle

	//eyes
	mov x1, 123
	mov x2, 304
	mov x3, 9
	mov x4, 9
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	ldr x0, black
	mov x1, 128
	mov x2, 309
	mov x3, 4
	mov x4, 4
	bl createVRectangle

	mov x2, 317
	bl createVRectangle

	ldr x30, [sp]
	add sp, sp, 8
	br x30


reduceToZeroScreen:
	sub sp, sp, 40
	str x30, [sp, 32]
	str x4, [sp, 24]
	str x3, [sp, 16]
	str x2, [sp, 8]
	str x1, [sp]

	// Temporary values
		// - x9: 	Temp save Y
		// - x10: 	Temp save X
		// - x11: 	Temp Line
	
	ldr x0, black
	mov x3, 100
	mov x4, 135
	mov x9, 89
	mov x10, 247
	mov x11, 0
	repeatReduce:
		mov x1, x9
		mov x2, x10
		add x2, x2, x11
		bl createVLine
		mov x2, x10
		add x2, x2, x4
		sub x2, x2, 1
		sub x2, x2, x11
		bl createVLine
		mov x2, x10
		mov x1, x9
		add x1, x1, x11
		bl createHLine
		mov x1, x9
		add x1, x1, x3
		sub x1, x1, 1
		sub x1, x1, x11	
		bl createHLine
		add x11, x11, 1
		cmp x11, 68
		ldr x7, delay_screen_long
		bl delay
		ble repeatReduce
	
	ldr x30, [sp, 32]
	add sp, sp, 40
	br x30


.globl transitionToTheGame
transitionToTheGame:
	//Guardado registros usados
	sub sp, sp, 8
	str x30, [sp]

	bl gradientScreen

	ldr x7, delay_screen_longlong
	bl delay

	bl donkeySplashScreen

	ldr x7, delay_screen_final
	bl delay

	bl donkeyFace

	ldr x7, delay_screen_longlong
	bl delay

	ldr x0, dark_brown_donkey
	mov x1, 105
	mov x2, 269
	mov x3,	68
	mov x4, 91
	bl createVRectangle

	bl donkeyFace2

	ldr x7, delay_screen_longlong
	bl delay

	bl reduceToZeroScreen

	bl logoDK

	ldr x30, [sp]
	add sp, sp, 8
	br x30
