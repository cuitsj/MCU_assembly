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
		mov r0,sbuf
		mov a,r0
		clr c
		subb a,#'A'-1
		jc loop
		mov a,r0
		clr c
		subb a,#'Z'+1
		jc next
		ajmp loop
next:	mov a,r0
		clr c
		subb a,#'A'
		add a,#'a'
		mov sbuf,a
		jnb ti,$
		clr ti
		ajmp loop
		
		end