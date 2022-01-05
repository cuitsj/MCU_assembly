		org 	0000h
		ajmp 	main
		org 	0003h
		ajmp 	key1
		org 	000bh
		ajmp  	t0zd
		org 	0013h
		ajmp 	key2
		
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
		
main:	mov dptr,#tab
		mov tmod,#01h
		mov th0,#high(-50000)
		mov tl0,#low(-50000)
		mov ie,#87h
		mov tcon,#15h
		mov r2,#0
		mov r3,#0
gx:		cjne r2,#20,show
		mov r2,#0
		inc r3
		cjne r3,#60,next
		mov r3,#0
next:	mov a,r3
		mov b,#10
		div ab
		mov r0,b
		mov r1,a
show:	mov a,r0
		movc a,@a+dptr
		mov p0,a
		mov p1,#07fh
		acall delay
		mov p1,#0ffh
		mov a,r1
		movc a,@a+dptr
		mov p0,a
		mov p1,#0bfh
		acall delay
		mov p1,#0ffh
		ajmp gx
		
		
t0zd:	mov th0,#high(-50000)
		mov tl0,#low(-50000)
		inc r2
		reti
		
key1:	mov a,r3
		add a,#10
		mov r3,a
		mov a,r3
		mov b,#10
		div ab
		cjne a,#6,next1
		mov r3,b
next1:	reti
		
key2:	inc r3
		reti 
		
delay:	mov r7,#0
		djnz r7,$
		ret
		
		end