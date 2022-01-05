		org 0000h
		ajmp main
		org 0023h
		ajmp sczd
		org 0033h
			
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
			
main:	mov dptr,#tab
		mov scon,#50h
		mov tmod,#20h
		mov tl1,#-3
		mov th1,#-3
		setb tr1
		mov ie,#90h
		mov r0,#0
			
loop:	cjne r4,#'$',next2
		ajmp next3
		
next2:	mov a,r1
		movc a,@a+dptr
		mov p0,a
		mov p1,#7fh
		acall delay
		mov p1,#0ffh
		mov a,r2
		movc a,@a+dptr
		mov p0,a
		mov p1,#0bfh
		acall delay
		mov p1,#0ffh
		mov a,r3
		movc a,@a+dptr
		mov p0,a
		mov p1,#0dfh
		acall delay
		mov p1,#0ffh
		ajmp loop
		
next3:	mov r4,#0
		mov a,r0
		mov sbuf,a
		mov a,r0
		mov b,#10
		div ab
		mov r1,b
		mov b,#10
		div ab
		mov r2,b
		mov r3,a
		mov r0,#0
		ajmp next2

sczd:	jnb ti,next1
		clr ti
		ajmp js
next1:	mov a,sbuf
		cjne a,#'A',next
		inc r0
next:	mov r4,a
		clr ri
js:		reti
		
delay:	mov r7,#0
		djnz r7,$
		ret
		
		end
		