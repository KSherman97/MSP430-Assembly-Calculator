	.file "func/sub.S"
	.text
.global sub

; this function is pretty self explanitory

sub:
	sub r14, r15	; subtract r14 from r15 and store that value in r15

	ret				; return the value from r15

