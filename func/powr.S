	.file "func/powr.S"
	.text
.global powr

; this function was tricky at first,
; but then I realized that we don't have to worry about negative values,
; but we do need to worry about the two special cases we may enounter
; case 1: power of 1
;	we know that anything to the power of 1 is itself, so that is simple to handle
; case 2: power of 0
; 	we know that anything to the power of 0 is 1, so that is also easy to handle

powr:
	clr r10 		; use this as a counter variable

	mov r14, r10	; move argument 2 into r10
	mov r15, r14	; move argument 1 into r14

	cmp #1, r10		; check how r10's value compares to 1
	jeq	one			; if r10 = 1, then jump to the case for power of 1

	cmp #0, r10		; check if the value of r10 is 0
	jeq zero		; if r10 = 0, then jump to the case for power of 0

	dec r10			; decrease the value of r10

	jmp loop		; jump to the main loop unconditionally

loop:
	call #mul		; call the multiplication subroutine to prevent from code duplication
	dec r10			; decrease the counter by 1
	cmp #0, r10		; is the counter at 0?
	jne loop		; if the counter is not zero, then let's loop again

	jmp done		; jump to done

; this is the function for power of zero
; anything to the zero power is 1, so we put that in r15 and return a value of 1
zero:
	mov #1, r15		; move a value of 1 to r15
	jmp done		; jump to done

; this is the function for power of one
; anything to the power of one is itself
; in this case, we will move the starting value into r15 and return that
one:
	 mov r14, r15	; move r14 to r15
	 jmp done		; jump to the done function

done:
	ret				; all done here. Return to the main loop
