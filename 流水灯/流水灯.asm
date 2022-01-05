	
	org 0000h
	sjmp main
	;---显示延时----------
ds1ms: mov r1,#1
ds1lo: mov r2,#200
ds2lo: mov r3,#200
       djnz r3,$
       djnz r2,ds2lo
       djnz r1,ds1lo
       ret ;延时返回
	   
;start:	mov r7,#8
main:mov r0,#8           ;一个循环需要移动8位
     mov p1,#01111111b   ;初始为P0.7灯点亮
loop: ;clr p2.3
      acall ds1ms         ;延时，以便人眼可以观察到
      ;setb p2.3
      ;acall ds1ms  
      mov a,p1            ;读P0口当前显示的数据送到A
      rr a                ;将A中的数据循环右移1位
      mov  p1,a            ;再将A中右移过的数据送到P0
      djnz r0,loop
      ;djnz r7,main           ;移动不够8位，跳到LOOP处循环,
	  sjmp main
	  ajmp $
      end



