		org 0000h
		ajmp main
		org 0033h
		
main:	mov scon,#50h
		mov tmod,#20h
		mov tl1,#-3
		mov th1,#-3
		setb tr1
		
		mov r0,#30h
loop:	;mov @r0,#08h
		mov a,#08h
		mov sbuf,a
		jnb ti,$
		clr ti
		inc r0
		cjne r0,#3fh,loop
		sjmp $
		
		end