##include <iostream>

#int main(void) {
#    int inferior, superior,i,j;
#    bool esPrimo;

#    std::cout << "\nPR1. Principios de Computadores.\n";
#    std::cout << "\nUn numero primo es un natural mayor que 1 que es divisble\n" 
#              << "unicamente entre 1 y el mismo. Este programa descubre los\n"
#              << "numero primos en un rango de numero naturales [a,b] siendo\n"
#              << "a y b naturales mayores que 1. El programa debera comprobar\n"
#              << "que se cumple ademas que b es mayor o igual que a y que son\n"
#              << "menores que 1001 para que ejecute en tiempo razonable.\n\n";
#   
#    while (true) {
#        std::cout << "Introduce el limite inferior [a]: ";
#        std::cin >> inferior;
#        if ((inferior < 2) || (inferior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }
#        std::cout << "Introduce el limite superior [b]: ";
#        std::cin >> superior;
#        if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }
#        break;
#    }

#    for (i = inferior; i <= superior; i++) {
#        esPrimo = true;
#        for (j = 2; j < i; j++) {
#            if (i % j == 0) {
#                esPrimo = false;
#                break;
#            }
#        }
#        if (esPrimo) {
#            std::cout << i << " ";
#        }
#    }
#    std::cout << "\nFin del programa.\n";
#    return 0;
#}

.data

titulo:		.ascii "\nPR1. Principios de Computadores.\n"
		.ascii "\nUn numero primo es un natural mayor que 1 que es divisble\n"
		.ascii "unicamente entre 1 y el mismo. Este programa descubre los\n"
		.ascii "numero primos en un rango de numero naturales [a,b] siendo\n"
		.ascii "a y b naturales mayores que 1. El programa debera comprobar\n"
		.ascii "que se cumple ademas que b es mayor o igual que a y que son\n"
		.asciiz "menores que 1001 para que ejecute en tiempo razonable.\n\n"
introduceinf:	.asciiz "Introduce el limite inferior [a]: "
error:		.asciiz "Error, vuelve a introducir el rango.\n"
introducesup:	.asciiz "Introduce el limite superior [b]: "
fin:		.asciiz "\nFin del programa.\n"

# REGISTROS
# $s0	inferior
# $s1	superior
# $t0	i
# $t1	j

.text
main:
#    int inferior, superior,i,j;
#    bool esPrimo;

#    std::cout << "\nPR1. Principios de Computadores.\n";
#    std::cout << "\nUn numero primo es un natural mayor que 1 que es divisble\n" 
#              << "unicamente entre 1 y el mismo. Este programa descubre los\n"
#              << "numero primos en un rango de numero naturales [a,b] siendo\n"
#              << "a y b naturales mayores que 1. El programa debera comprobar\n"
#              << "que se cumple ademas que b es mayor o igual que a y que son\n"
#              << "menores que 1001 para que ejecute en tiempo razonable.\n\n";

	li $v0, 4
	la $a0, titulo
	syscall

#    while (true) {
#        std::cout << "Introduce el limite inferior [a]: ";
while:

	li $v0, 4
	la $a0, introduceinf
	syscall

#        std::cin >> inferior;
	li $v0, 5
	syscall
	move $s0, $v0

#        if ((inferior < 2) || (inferior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }
if_inf:
	blt $s0, 2, error_uno
	bgt $s0, 1000, error_uno
	
	b if_inf_fin

error_uno:
	li $v0, 4
	la $a0, error
	syscall

	b while

if_inf_fin:
#        std::cout << "Introduce el limite superior [b]: ";
#        std::cin >> superior;
	li $v0, 4
	la $a0, introducesup
	syscall


#        std::cin >> superior;
	li $v0, 5
	syscall
	move $s1, $v0

if_sup:
#        if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }

	blt $s1, 2, error_dos
	blt $s1, $s0, error_dos
	bgt $s1, 1000, error_dos
	
	b if_sup_fin
	
error_dos:
	
	li $v0, 4
	la $a0, error
	syscall
	
	b if_inf_fin
	
if_sup_fin:
move $t0, $s0

# $s0 = inferior (a)
# $s1 = superior (b)
# $t0 = i (contador del primer for)
# $t1 = j (contador del segundo for)
# $t2 = esPrimo (1 si es primo, 0 si no)

for_i:
    bgt $t0, $s1, for_fin  # Si i > superior, salir del bucle principal

    li $t2, 1     # esPrimo = true
    li $t1, 2     # j = 2

for_j:
    bge $t1, $t0, check_prime  # Si j >= i, salir del bucle secundario

    div $t0, $t1    # Divide i entre j
    mfhi $t3        # Obtiene el residuo en $t3
    beqz $t3, not_prime  # Si i % j == 0, no es primo

    addi $t1, $t1, 1  # j++
    j for_j

not_prime:
    li $t2, 0  # esPrimo = false

check_prime:
    beqz $t2, next_i  # Si no es primo, pasar al siguiente número

    # Imprimir número primo
    move $a0, $t0
    li $v0, 1
    syscall

    # Imprimir espacio entre números
    li $v0, 4
    la $a0, espacio
    syscall

next_i:
    addi $t0, $t0, 1  # i++
    j for_i  # Repetir el bucle

for_fin:
    li $v0, 4
    la $a0, fin
    syscall

    li $v0, 10
    syscall