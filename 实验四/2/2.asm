		org 0000h
		ajmp main
		org 0033h
		
main:	mov scon,#50h
		mov tmod,#20h
		mov tl1,#-3
		mov th1,#-3
		setb tr1
		
loop:	jnb p1.0,down
		ajmp loop
down:	mov sbuf,#'b'
		jnb ti,$
		clr ti
		ajmp loop
		
		
		end