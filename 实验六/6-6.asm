		org 0000h
		ajmp main
		org 001bh
		ajmp tzd1
		org 0033h

main:	mov tmod,#60h
		mov th1,#-200
		mov tl1,#-200
		mov ie,#88h
		setb tr1
		
		sjmp $
			
tzd1:	cpl p1.1
		reti
		
		end