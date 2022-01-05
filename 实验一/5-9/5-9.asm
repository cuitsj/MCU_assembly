		org 0000h
		sjmp main
		org 0033h
main: 	setb p1.0
		lcall delayh
		clr p1.0
		lcall delayl
		mov 40h,b
		sjmp main
		
delayh:	mov r7,#2
de:		mov r6,#200
		djnz r6,$
		djnz r7,de
		ret

delayl:	mov r6,#100
		djnz r6,$
		ret
		end