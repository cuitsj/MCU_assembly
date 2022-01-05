		org 0000h
		sjmp main
		org 0003h
		sjmp key1
		org 0013h
		sjmp key2
		
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
			
main:	mov tcon,#05h
		mov ie,#85h
		mov r0,#98
		mov dptr,#tab
dis:	mov a,r0
		mov b,#10
		div ab
		movc a,@a+dptr
		mov p1,#0ffh
		mov p0,a
		mov p1,#0efh	;p1.4
		acall delay
		mov a,b
		movc a,@a+dptr
		mov p1,#0ffh
		mov p0,a
		mov p1,#0dfh	;p1.5
		sjmp dis
		
		
delay:	mov r7,#10
		djnz r7,$
		ret
key1:	inc r0
		cjne r0,#100,next1
		mov r0,#0
next1:	reti
key2:	dec r0
		cjne r0,#-1,next2
		mov r0,#99
next2:	reti
		
		end