		org		0000h
		ajmp 	main
		org 	0033h
			
main:	mov tmod,#20h
		mov scon,#50h	
		mov tl1,#-3
		mov th1,#-3
		setb tr1
		
		mov	sbuf,#'H'
		jnb ti,$
		clr ti
		mov	sbuf,#'e'
		jnb ti,$
		clr ti
		mov	sbuf,#'l'
		jnb ti,$
		clr ti
		mov	sbuf,#'l'
		jnb ti,$
		clr ti
		mov	sbuf,#'o'
		jnb ti,$
		clr ti
		
loop:	jnb ri,$
		clr ri
		mov a,sbuf
		subb a,#01h
		mov sbuf,a
		jnb ti,$
		clr ti
		ajmp loop
		
		end
		
		