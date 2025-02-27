# Marcos Barbuzano Socorro
# TABLA
# pi $f20
# radio $f21
.data
introduce:	.asciiz "Dame radio: "
radioes: 	.asciiz "El radio es: "

.text
main:
li $v0, 4
la $a0, introduce
syscall

li $v0, 6
syscall
mov.s $f21, $f0

li.s $f20, 3.14

mul.s $f22, $f21, $f21
mul.s $f22, $f22, $f20

li $v0, 2
mov.s $f12, $f22
syscall

li $v0, 10
syscall
