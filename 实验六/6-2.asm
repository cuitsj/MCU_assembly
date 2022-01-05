		org 	0000h
		ajmp 	main
		org		0003h
		ajmp	zd0
		org 	0033h
			
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
		
main:	mov a,#82h
		mov dptr,#0c003h
		movx @dptr,a

		mov tcon,#01h
		mov ie,#81h
		mov dptr,#0b000h
		movx @dptr,a
		
loop:	mov dptr,#0c001h
		movx a,@dptr
		mov dptr,#0c000h
		movx @dptr,a
		mov dptr,#0c002h
		movx @dptr,a

		mov b,#10
		mov a,r0
		cjne a,#100,next
		ajmp next2
next:	jc xy
		mov p1,#0fh
		ajmp next2
xy:		mov p1,#0f0h
		
next2:	div ab
		mov r1,b
		mov b,#10
		div ab
		mov r2,b
		mov r3,a
		
		mov dptr,#tab
		mov a,r1
		movc a,@a+dptr
		mov dptr,#8000h
		movx @dptr,a
		mov dptr,#9000h
		mov a,#07h
		movx @dptr,a
		acall delay
		mov a,#0fh
		movx @dptr,a
		
		mov dptr,#tab
		mov a,r2
		movc a,@a+dptr
		mov dptr,#8000h
		movx @dptr,a
		mov dptr,#9000h
		mov a,#0bh
		movx @dptr,a
		acall delay
		mov a,#0fh
		movx @dptr,a
		
		mov dptr,#tab
		mov a,r3
		movc a,@a+dptr
		mov dptr,#8000h
		movx @dptr,a
		mov dptr,#9000h
		mov a,#0dh
		movx @dptr,a
		acall delay
		mov a,#0fh
		movx @dptr,a
		
		ajmp loop
		
delay:	mov r7,#0
		djnz r7,$
		ret		

zd0:	mov dptr,#0b000h
		movx a,@dptr
		mov r0,a
		reti 
		
		end