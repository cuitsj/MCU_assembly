		org 0000h
		ajmp main
		org 001bh
		ajmp t1zd
		
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
		
main:	mov dptr,#tab
		mov r2,#0
		mov r0,#30h
		mov tmod,#16h
		
start:	clr f0
		mov th1,#high(-50000)
		mov tl1,#low(-50000)
		mov th0,#0h
		mov tl0,#0h
		mov tcon,#50h
		mov ie,#88h
gx:		cjne r2,#20,show
		mov tcon,#0h
		mov ie,#0h
		mov r2,#0
		mov a,tl0
		mov b,#10
		div ab
		mov 30h,b
		mov b,#10
		div ab
		mov 31h,b
		mov 32h,a
		setb f0
		
show:	mov a,@r0
		movc a,@a+dptr
		mov p0,a
		mov p1,#7fh
		acall delay
		mov p1,#0ffh
		inc r0
		mov a,@r0
		movc a,@a+dptr
		mov p0,a
		mov p1,#0bfh
		acall delay
		mov p1,#0ffh
		inc r0
		mov a,@r0
		movc a,@a+dptr
		mov p0,a
		mov p1,#0dfh
		acall delay
		mov p1,#0ffh
		mov r0,#30h
		jb f0,start
		ajmp gx
			
t1zd:	mov th1,#high(-50000)
		mov tl1,#low(-50000)
		inc r2
		reti
		
delay:	mov r7,#0
		djnz r7,$
		ret
		
		end
		
		
		