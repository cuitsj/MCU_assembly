		org 0000h
		ajmp main
		org 0033h
		
main:	mov scon,#50h
		mov tmod,#20h
		mov tl1,#-3
		mov th1,#-3
		mov r0,#0
		mov r1,#0
		setb tr1
		
loop:	jnb ri,$
		clr ri
		inc r1
		mov a,sbuf
		addc a,r0
		mov r0,a
		cjne r1,#16,loop
		mov sbuf,r0
		jnb ti,$
		clr ti
		sjmp $
		
		end