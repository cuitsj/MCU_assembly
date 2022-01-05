		org 	0000h
		ajmp 	main
		org		0003h
		ajmp	zd0
		org 	0033h
			
main:	mov tcon,#01h
		mov ie,#81h
		clr f0
		mov r0,#0fh
		mov p2,r0
		
		jnb f0,$
loop:	mov a,r0
		rr a
		mov r0,a
		mov p2,r0
		acall delay
		ajmp loop

zd0:	setb f0
		reti 

delay:	mov r7,#0
de:		mov r6,#0
		djnz r6,$
		djnz r7,de
		ret	
		
		end
		
		