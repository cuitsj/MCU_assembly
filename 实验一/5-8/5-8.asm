		org 0000h
		sjmp start
		org 0033h
delay:	mov r5,#50
del:	mov r4,#100
		djnz r4,$
		djnz r5,del
		ret
		
start:	mov p3,#11111100b
		mov a,p3
		cjne a,#11111100b,loop1
		sjmp start
loop1:	lcall delay
		mov a,p3
		cjne a,#11111100b,loop2
		sjmp start
loop2:	xrl a,#11111100b
		mov r0,a
		mov p3,#00000011b
		mov a,p3
		xrl a,#00000011b
		orl a,r0
		mov r0,a		;µÃµ½¼üÖµ
loop3:	mov p3,#11111100b
		mov a,p3
		cjne a,#11111100b,loop3
		lcall delay
		mov a,p3
		cjne a,#11111100b,loop3
		mov a,r0
		cjne a,#05h,next1
		sjmp n0
next1:	cjne a,#09h,next2
		sjmp n1
next2:	cjne a,#11h,next3
		sjmp n2
next3:	cjne a,#21h,next4
		sjmp n3
next4:	cjne a,#41h,next5
		sjmp n4
next5:	cjne a,#06h,next6
		sjmp n5
next6:	cjne a,#0ah,next7
		sjmp n6
next7:	cjne a,#12h,next8
		sjmp n7
next8:	cjne a,#22h,next9
		sjmp n8
next9:	cjne a,#42h,start
		sjmp n9
n0:		mov p0,#3fh
		clr p2.0
		sjmp start
n1:		mov p0,#06h
		clr p2.0
		sjmp start
n2:		mov p0,#5bh
		clr p2.0
		sjmp start
n3:		mov p0,#4fh
		clr p2.0
		sjmp start
n4:		mov p0,#66h
		clr p2.0
		ajmp start
n5:		mov p0,#6dh
		clr p2.0
		ajmp start
n6:		mov p0,#7dh
		clr p2.0
		ajmp start
n7:		mov p0,#07h
		clr p2.0
		ajmp start
n8:		mov p0,#7fh
		clr p2.0
		ajmp start
n9:		mov p0,#6fh
		clr p2.0
		ajmp start
		end
		

		

		
		