		org 	0000h
		ajmp 	main
		org		0003h
		ajmp	zd0
		org 	0033h

tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
			
main:	mov dptr,#tab
		mov tcon,#01h
		mov ie,#81h
		clr f0
loop:	mov a,#1
		movc a,@a+dptr
		mov p0,a
		mov p1,#7fh
		acall delay
		mov p1,#0ffh
		
		mov a,#2
		movc a,@a+dptr
		mov p0,a
		mov p1,#0bfh
		acall delay
		mov p1,#0ffh
		
		mov a,#3
		movc a,@a+dptr
		mov p0,a
		mov p1,#0dfh
		acall delay
		mov p1,#0ffh
		
		mov a,#4
		movc a,@a+dptr
		mov p0,a
		mov p1,#0efh
		acall delay
		mov p1,#0ffh
		
		jnb f0,loop
		
loop1:	mov a,#5
		movc a,@a+dptr
		mov p0,a
		mov p1,#7fh
		acall delay
		mov p1,#0ffh
		
		mov a,#6
		movc a,@a+dptr
		mov p0,a
		mov p1,#0bfh
		acall delay
		mov p1,#0ffh
		
		mov a,#7
		movc a,@a+dptr
		mov p0,a
		mov p1,#0dfh
		acall delay
		mov p1,#0ffh
		
		mov a,#8
		movc a,@a+dptr
		mov p0,a
		mov p1,#0efh
		acall delay
		mov p1,#0ffh
		
		ajmp loop1

zd0:	setb f0
		reti 

delay:	mov r7,#0
		djnz r7,$
		ret	
		
		end