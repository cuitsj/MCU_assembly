		org 	0000h
		ajmp 	main
		org		0003h
		ajmp	zd0
		org 	0033h
			
main:	mov tcon,#01h
		mov ie,#81h
		mov r0,#0
		mov a,#0
		mov dptr,#0a000h
		movx @dptr,a
		
		cjne r0,#0ffh,$
loop:	cjne r0,#0ffh,next
		mov a,#51
		mov dptr,#0a000h
		movx @dptr,a
		ajmp loop
next:	mov a,#153
		mov dptr,#0a000h
		movx @dptr,a
		ajmp loop
		
zd0:	mov a,r0
		cpl a
		mov r0,a
		reti 
		
		end
		
		