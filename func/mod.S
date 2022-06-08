	.file "mod.S"
	.text
.global mod

; We don't need to worry about handling negative values per the instruction
; this algorith divides until the divisor is less than the base number
; the remaining value is the remainder and that is moved into r15 for output

mod:
	mov r15, r13			; move arg1 into r13
	clr r15					; reset r15 to zero

	jmp sub					; jump to the sub function

sub:
	sub r14, r13			; subtract r14 from r13 and set r13

	cmp r14, r13			; compare r14 and r13
	jge sub					; loop again if condition is met

	mov r13, r15			; move the value of r13 into r15

	ret						; we're good. Let's skidaddle
