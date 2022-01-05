		org 	0000h
		ajmp 	main
		org		0033h
			
main:	mov a,#82h
		mov dptr,#0c003h
		movx @dptr,a
		
loop:	mov dptr,#0c001h
		movx a,@dptr
		mov dptr,#0c000h
		movx @dptr,a
		mov dptr,#0c002h
		movx @dptr,a
		ajmp loop
		
		end
		
		