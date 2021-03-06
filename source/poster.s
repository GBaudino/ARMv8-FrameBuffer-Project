.include "data.s"
.include "utilities.s"

createDonkey:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	//Creación de la parte marrón
	ldr x0, brown_donkey
	mov x1, 103
	mov x2, 539
	mov x3,	4
	mov x4, 19
	bl createVRectangle
	
	mov x1, 107
	mov x3,	1
	mov x4, 14
	bl createVRectangle

	mov x1, 108
	mov x2, 534
	mov x3,	5
	mov x4, 19
	bl createVRectangle

	mov x1, 113
	mov x2, 529
	mov x4, 35
	bl createVRectangle
	
	mov x1, 118
	mov x2, 514
	mov x4, 40
	bl createVRectangle

	mov x1, 123
	mov x2, 509
	mov x4, 30
	bl createVRectangle

	mov x1, 128
	mov x2, 504
	mov x4, 35
	bl createVRectangle

	mov x1, 133
	mov x2, 499
	mov x4, 45
	bl createVRectangle

	mov x1, 138
	mov x4, 40
	bl createVRectangle

	mov x1, 143
	mov x2, 494
	bl createVRectangle

	mov x1, 148
	mov x3,	11
	mov x4, 50
	bl createVRectangle

	mov x1, 159
	mov x2, 488
	mov x3,	15
	mov x4, 51
	bl createVRectangle

	mov x1, 174
	mov x2, 494
	mov x3,	5
	mov x4, 20
	bl createVRectangle

	mov x1, 179
	mov x2, 488
	bl createVRectangle

	mov x1, 174
	mov x2, 519
	bl createVRectangle

	mov x1, 179
	mov x2, 529
	mov x4, 10
	bl createVRectangle

	mov x1, 163
	mov x2, 554
	mov x3,	15
	bl createVRectangle

	mov x1, 174
	mov x2, 559
	mov x3,	10
	bl createVRectangle

	mov x1, 122
	mov x2, 549
	mov x3,	11
	mov x4, 5
	bl createVRectangle

	mov x1, 133
	mov x2, 564
	mov x3,	5
	bl createVRectangle

	ldr x0, dark_brown_donkey
	mov x1, 154
	mov x2, 514
	mov x3,	15
	bl createVRectangle

	mov x1, 164
	mov x2, 509
	mov x3,	5
	bl createVRectangle


	//Creación parte rosa
	ldr x0, light_pink_donkey
	mov x1, 184
	mov x2, 560
	mov x4, 9
	bl createVRectangle

	mov x2, 519
	mov x4, 20
	bl createVRectangle

	mov x2, 488
	mov x4, 26
	bl createVRectangle

	mov x1, 179
	mov x2, 524
	mov x4, 5
	bl createVRectangle

	mov x1, 169
	mov x2, 514
	bl createVRectangle

	mov x2, 534
	mov x3,	4
	mov x4, 10
	bl createVRectangle

	mov x1, 159
	mov x2, 539
	mov x3,	10
	mov x4, 5
	bl createVRectangle

	mov x1, 158
	mov x2, 549
	mov x3,	5
	mov x4, 20
	bl createVRectangle

	mov x1, 148
	mov x2, 544
	mov x3,	10
	mov x4, 30
	bl createVRectangle

	mov x1, 138
	mov x2, 539
	mov x4, 40
	bl createVRectangle

	mov x1, 133
	mov x2, 544
	mov x3,	5
	mov x4, 20
	bl createVRectangle

	mov x2, 569
	mov x4, 5
	bl createVRectangle

	mov x1, 123
	mov x2, 539
	mov x3,	10
	mov x4, 10
	bl createVRectangle

	mov x1, 118
	mov x2, 554
	mov x3,	4
	mov x4, 15
	bl createVRectangle

	//Creación corbata
	ldr x0, red_tie
	mov x2, 524
	mov x3,	15
	mov x4, 5
	bl createVRectangle

	mov x1, 133
	mov x2, 529
	mov x3,	5
	bl createVRectangle

	mov x1, 138
	mov x2, 534
	mov x3,	10
	bl createVRectangle

	mov x1, 148
	mov x2, 539
	mov x3,	5
	bl createVRectangle

	mov x1, 158
	mov x2, 544
	mov x3,	21
	bl createVRectangle

	mov x1, 163
	mov x2, 549
	mov x3,	26
	bl createVRectangle

	mov x1, 176
	mov x2, 554
	mov x3,	6
	bl createVRectangle

	//Creación de ojos y boca
	ldr x0, donkey_white
	mov x1, 122
	mov x2, 554
	mov x3,	11
	mov x4, 6
	bl createVRectangle

	ldr x0, black
	mov x2, 560
	mov x4, 4
	bl createVRectangle

	mov x1, 144
	mov x2, 549
	mov x3,	4
	mov x4, 5
	bl createVRectangle

	mov x1, 148
	mov x2, 554
	mov x3,	5
	mov x4, 20
	bl createVRectangle


	ldr x30, [sp]
	add sp, sp, 8
	br x30


.globl createPoster
createPoster:
	//Guardado registro return
	sub sp, sp, 8
	str x30, [sp]

	ldr x0, yellow_poster
	mov x1, 88
	mov x2, 470
	mov x3,	116
	mov x4, 127
	bl createVRectangle

	ldr x0, donkey_white
	mov x1, 85
	mov x2, 465
	mov x3,	4
	mov x4, 138
	bl createVRectangle

	mov x1, 202
	bl createVRectangle

	mov x1, 82
	mov x2, 468
	mov x3,	127
	mov x4, 4
	bl createVRectangle

	mov x2, 596
	bl createVRectangle
	
	bl createDonkey

	ldr x30, [sp]
	add sp, sp, 8
	br x30
