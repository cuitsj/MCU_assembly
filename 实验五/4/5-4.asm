		org 	0000h
		ajmp 	main
		org		0033h
			
main:	mov r0,#51
loop1:	mov dptr,#0a000h
		mov a,r0
		movx @dptr,a
		inc r0
		cjne r0,#102,loop1
		mov dptr,#0a000h
		mov a,r0
		movx @dptr,a
		acall delay
loop2:	mov dptr,#0a000h
		mov a,r0
		movx @dptr,a
		dec r0
		cjne r0,#51,loop2
		ajmp loop1
		
delay:	mov r7,#0
		djnz r7,$
		ret		

		end
		
		