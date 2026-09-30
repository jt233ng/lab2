@
@ Assembler program print out "Hello World"
@ using the Pico SDK.
@
@ R0 - first parameter to printf
@ R1 - second parameter to printer
@ R7 - index counter
@

.thumb_func		    @ Necessary because sdk uses BLX
.global main	            @ Provide program starting address to linker

main:
	MOV	R7, #100		@ changed to 100 initialize counter to 0
	BL	stdio_init_all	@ Anpassung in .txt datei für USB initialize uart or usb
loop:
	LDR	R0, =helloworld	@ load address of helloworld string 
	MOV R1, R7 @ R0,R1,R2,R4 are the paramters some functions get 
	PUSH {R0}		@Value load to stack to safe them for function 
	PUSH {R1}
	BL	printf		@ Call pico_printf
	POP {R1}
	POP {R0}
	CMP R7, #0		@Sets eine Flagge eig CBZ nutzen wollen ist aber LEGv8
	BEQ reset		@wen zero dann spring beipsiel seite 254
	SUB R7, #1		@ Counter runterzählen
	B	loop		@ loop forever
reset:
	MOV R7, #100
	B loop
.data
	       .align  4	@ necessary alignment
helloworld: .asciz   "Hello World %d\n"
