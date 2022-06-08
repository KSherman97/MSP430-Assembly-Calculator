	.file "func/mul.S"
	.text
.global mul

mul:
	clr	r13			; initialize r13 to zero
	mov	r14, r11	; move r14 to r11. We do this so we can call from the power function and keep r14 untouched

	cmp #0, r11		; check if we're multiplying by zero
	jeq done		; if we are multiplying to zero, then we're done

	jmp addPos		; skip to the add loop section

addPos:
	cmp #0, r11		; check if r11 is zero
	jeq done		; if r11 is less than 0, then we're done

	add r15, r13	; roll r15 into r13 and set it
	dec r11 		; decriment the r14 by 1
	jmp addPos		; non-conditional jump

done:
	mov r13, r15	; replace the value of r13 into r15

	ret				; all done here, go back from where we came
