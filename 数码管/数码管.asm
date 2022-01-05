		org 0000h
		ljmp start
		org 0200h
			
;_______将tab2中的内容装入以30h为首地址的内存单元_________;
start:	mov dptr,#tab2
		mov r0,#30h
		
main:	movc a,@a+dptr
		mov @r0,a
		clr a
		inc dptr
		inc r0
		cjne @r0,#0f0h,main	;0-f转移完毕
		
		;dec r0
		;mov @r0,#0
		;inc r0
		;mov @r0,#0
		;inc r0
		;mov @r0,#0
		
		;mov a,r0		;存放数据个数
		;subb a,#8
		;mov b,a		;存放最大偏移段选
		
			
;_______6位数码管显示6位数据_________;
		;mov r4,#2fh
;l3:		inc r4
		;mov a,r4
		;cjne a,b,l4
		;mov r4,#30h
;l4:		mov r7,#10		
;l1:		mov r6,#20

;l2:		mov a,r4
		;mov r0,a
		;djnz r6,loop1
		;djnz r7,l1	
		;sjmp l3
		mov r0,#30h
		
;_______6位数码管显示6位数据_________;
loop1:	mov r1,#0feh	;位选
		mov r2,#8		;显示数字位数
		mov dptr,#tab1
		
loop2:	mov a,@r0
		movc a,@a+dptr	;取出段选码	
		mov p0,a		;段选
		mov p2,r1		;位选
		lcall delay
		inc r0
		mov a,r1
		rl a
		mov r1,a
		djnz r2,loop2	;显示完一组8位数
		sjmp loop1
		
delay:	mov r3,#0
		djnz r3,$
		ret
		
tab1:	db 3fh,06h,5bh,4fh,66h,6dh		;0-f阴极数码管编码
		db 7dh,07h,7fh,6fh,77h,7ch
		db 39h,5eh,79h,71h,0h,6dh,1ch,1eh,04h,54h			;0ffh结束位
			
tab2:	db 2h,0h,1h,5h,0h,7h,2h,0h
		db 5h,8h,10h,11h,12h,13h,14h,15h
		db 10h,10h,10h,10h,10h,10h,0f0h	;要显示的0-f的多个数据
			
		end