		org 0000h
		ajmp main
		org 0033h
		
main:	mov scon,#50h
		mov tmod,#20h
		mov tl1,#-3
		mov th1,#-3
		setb tr1
		
loop:	jnb ri,$
		clr ri
		mov a,sbuf
		cjne a,#08h,next
		mov sbuf,#'O'
		jnb ti,$
		clr ti
		mov sbuf,#'K'
		jnb ti,$
		clr ti
		ajmp loop
next:	mov sbuf,#'E'
		jnb ti,$
		clr ti
		mov sbuf,#'R'
		jnb ti,$
		clr ti
		mov sbuf,#'R'
		jnb ti,$
		clr ti
		ajmp loop
		
		
		end