;a*rd*rd = ?     this program calculate the answer of  multiplatction of three 8 bits numbers ! enjoy

ldi r16,125 //rd
ldi r17,10 //a

//xh:xl=rd*rd				   dddd,dddd ffff,ffff
mul r16,r16
mov xl,r0  
mov xh,r1

//zl:yh:yl=a*rd*rd
mul xl,r17							//yh:yl <-- r17* (ffff,ffff)
mov yl,r0  
mov yh,r1
				  
mul xh,r17							// zh:zl <-- r17* (dddd,dddd)
mov zl,r0  
mov zh,r1

add yh,zl						  
mov r30,r31
clr r31

/*						
		   <<	  algorithem     >>
						  0001 1101
					  *
							   0010
					  = --------
			c:xh:xl  cccc 0011 1010

			yh:yl  0001 1010
			and
			zh:zl  0000 0010

			xl=yl
			xh=yh+zl;
			c=zh;                          */
