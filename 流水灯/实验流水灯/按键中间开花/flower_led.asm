		org 	0000h
		sjmp 	main
		org 	0033h

tab: db 18h, 24h,42h, 81h
	
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh

main:	mov 30h,#2
		mov 31h,#0
		mov 32h,#1
		mov 33h,#5
		mov 34h,#0
		mov 35h,#7
		mov 36h,#2
		mov 37h,#0
		mov dptr,#tab
		
start:	mov r0,#30h
		mov r1,#0feh	;位选
		mov r7,#8		;显示数字位数
		
loop:	mov a,@r0
		movc a,@a+dptr
		mov p2,#0ffh	;消影
		
		mov p0,a		;段选
		mov p2,r1		;位选
		inc r0
		mov a,r1
		rl a
		mov r1,a
		djnz r7,loop
		sjmp start
		

		
		
		
main:	mov dptr, #tab
		mov r2,#00000000b
		mov r0,#3
		mov r1,#0
		mov a,r0
		movc a,@a+dptr
		mov p1,a
loop1:	acall delay

		jb p3.2, bfz
		mov a, r2		
		cpl a
		mov r2,a
		
bfz:	cjne r2,#00000000b,kai
		sjmp bi
kai:	mov a,r0
		dec a
		mov r0,a
		cjne r0,#-1,loop
		mov r0,#3
		mov a,r0
		sjmp loop
bi:		mov a,r1
		inc a
		mov r1,a
		cjne r1,#4,loop
		mov r1,#0
		mov a,r1
		
		
loop:	movc a,@a+dptr
		mov p1,a
		sjmp loop1
		
delay:	mov r7,#200
del:	mov r6,#200
		djnz r6,$
		djnz r7,del
		ret
		end