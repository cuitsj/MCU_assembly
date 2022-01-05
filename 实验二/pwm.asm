		org 0000h
		ajmp main
		org 001bh
		ajmp timer1

main:  	mov r0,#0
		mov tmod,#20h
		mov th1,#-250
		mov tl1,#-250
		setb p1.0
		setb ea
		setb et1
		setb tr1
		sjmp $
			
timer1: inc r0
		cjne r0,#20,next
		clr p1.0
next:	cjne r0,#120,next1
		setb p1.0
		mov r0,#0

next1: 	reti
		
		end
		