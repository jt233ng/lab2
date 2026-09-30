@
@ Assembler program to flash three LEDs connected to the
@ Raspberry Pi Pico GPIO port using the Pico SDK.
@

	.EQU	LED_PIN1, 0 @ Gibt LED_PIN1 den Wert 18
	.EQU	LED_PIN2, 1
	.EQU	LED_PIN3, 2
	.EQU	GPIO_OUT, 1
	.EQU	sleep_time, 1000 @ in millisec

.thumb_func	@ Necessary because sdk uses BLX damit die Befehle richtig interpretiert werden
.global main    @ Provide program starting address

main:
	MOV	R0, #LED_PIN1 @ in register R0 setze LED_PIN1 adresse ein 
	BL	gpio_init @initaliesiert
	MOV	R0, #LED_PIN1 @Welcher Pin gesetzt werden soll
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir @ Setze Pin als Output oder Input
	MOV	R0, #LED_PIN2 
	BL	gpio_init
	MOV	R0, #LED_PIN2
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir
	MOV	R0, #LED_PIN3
	BL	gpio_init
	MOV	R0, #LED_PIN3
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir
loop:
	@ for 000
	MOV	R0, #LED_PIN1 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #0
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 001
	MOV	R0, #LED_PIN1 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #0
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 010
	MOV	R0, #LED_PIN1 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #0
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 011
	MOV	R0, #LED_PIN1 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #0
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 100
	MOV	R0, #LED_PIN1 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #1
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 101
	MOV	R0, #LED_PIN1 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #1
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 110
	MOV	R0, #LED_PIN1 
	MOV	R1, #0
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #1
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	@ for 111
	MOV	R0, #LED_PIN1 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN2 
	MOV	R1, #1
	BL	link_gpio_put 
	MOV	R0, #LED_PIN3 
	MOV	R1, #1
	BL	link_gpio_put 

	LDR	R0, =sleep_time @load sleep_time von oben in R0
	BL	sleep_ms @ führe aus wartet

	B       loop
