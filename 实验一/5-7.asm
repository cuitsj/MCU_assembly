		org 0000h
		sjmp main
		org 0033h

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
		mov r2,#8		;显示数字位数
		
loop:	mov a,@r0
		movc a,@a+dptr
		mov p2,#0ffh	;消影
		
		mov p0,a		;段选
		mov p2,r1		;位选
		
		
		;lcall delay
		inc r0
		mov a,r1
		rl a
		mov r1,a
		djnz r2,loop
		sjmp start
		
delay:	mov r3,#10
		djnz r3,$
		ret
		
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh,76h
			
		end