	.file "func/add.S"
	.text
.global add

; this function is pretty self explanitory

add:
	add r14, r15 	; add the values of the two registry locations together and place in r15

	ret 			; return the value that is in registry r15
