	.file "func/divd.S"
	.text
.global divd

; for division I needed to check and handle the following
; 1. numerator is negative
; 2. denominator is negative
; 3. both are negative

; I invert the negatives and invert the outcome as needed to
; solve the issue of negative values

divd:
	mov r15, r13		; move the value of r15 to r13
	clr r15				; reset r15 to zero

	cmp #0, r13			; check if numerator is negative
	jl numNegCheck 		; jump for negative numerator

	cmp #0, r14			; check if denominator is negative
	jl denNegCalc		; jump for negative denominator

	jmp noNegCalc		; both numerator and denominator are positive

; this is executed when the numerator is negative so we can
; check if the denominator is also negative or not
numNegCheck:
	cmp #0, r14			; check if the denominator is also negative
	jl bothNegCalc		; jump to the function for neg numerator and denominator

	jmp numNegCalc		; jump to function for only negative numerator

; because the numerator is neg and the denominator is pos,
; the output will be negative
; note, if you don't increment by one after inverting, then the
; value will be off by one
numNegCalc:
	inv r13				; invert r13 to a positive and add one to match up
	inc r13

	call #noNegCalc		; call the calculation function with our new values and return r15

	inv r15				; invert the result to a negative number
	inc r15				; increment by one

	ret					; all done

; similar to the numerator, this is called when the denominator is negative
; everything else is the same, but performed on the denominator instead
denNegCalc:
	inv r14				; invert r14 and increment it
	inc r14

	call #noNegCalc		; call the main calculation function with these new values in memory

	inv r15				; invert and increment the result
	inc r15

	ret					; all done


; this function is called when both the numerator and the denominator are negative
; in this case, we just need to invert them to positive values and continue to the main calculation function
; because the output will be positive as well
bothNegCalc:
	inv r14				; invert r14 and increment
	inc r14

	inv r13				; invert r13 and increment
	inc r13

	jmp noNegCalc		; jump unconditionally

noNegCalc:
	sub r14, r13		; subtract r14 from r15 and set

	inc r15				; increment r15

	cmp r14, r13		; compare r14 and r13
	jge noNegCalc		; loop again if condition is met

	ret					; finally, we're all done here

