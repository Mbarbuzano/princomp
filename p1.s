#include <iostream>

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
titulo:       .ascii "\nPR1. Principios de Computadores.\n"
              .ascii "\nUn numero primo es un natural mayor que 1 que es divisble\n"
              .ascii "unicamente entre 1 y el mismo. Este programa descubre los\n"
              .ascii "numero primos en un rango de numero naturales [a,b] siendo\n"
              .ascii "a y b naturales mayores que 1. El programa debera comprobar\n"
              .ascii "que se cumple ademas que b es mayor o igual que a y que son\n"
              .asciiz "menores que 1001 para que ejecute en tiempo razonable.\n\n"
introduceinf: .asciiz "Introduce el limite inferior [a]: "
error:        .asciiz "Error, vuelve a introducir el rango.\n"
introducesup: .asciiz "Introduce el limite superior [b]: "
fin:          .asciiz "\nFin del programa.\n"

#TABLA DE REGISTRO
# $s0 inferior
# $s1 superior

      .text

main:
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
#        std::cin >> inferior;
while:
li $v0,4
la $a0, introduceinf
syscall

li $v0, 5
syscall
move $s0, $v0

#        if ((inferior < 2) || (inferior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }
bgt $s0, 2, superior
blt $s0, 100, superior

li $v0, 4
la $a0, error
syscall

b while

#        std::cout << "Introduce el limite superior [b]: ";
#        std::cin >> superior;
#        if ((superior < 2) || (superior < inferior) || (superior > 1000)) {
#            std::cout << "Error, vuelve a introducir el rango.\n";
#            continue;
#        }
#        break;
#    }
superior:
li $v0, 4
la $a0, introducesup
syscall

li $v0, 5
syscall
move $s1, $v0

bgt $s1, 2, for
blt $s1, 1000, for

li $v0, 4
la $a0, error
syscall

b superior

#    for (i = inferior; i <= superior; i++) {
#        esPrimo = true;
#        for (j = 2; j < i; j++) {
#            if (i % j == 0) {
#                esPrimo = false;
#                break;
#            }
#        }
for:
    move $t0, $s0   # i = inferior

loop_i:
    bgt $t0, $s1, end_loop   # Si i > superior, salir

    li $t2, 1       # esPrimo = true
    li $t1, 2       # j = 2

loop_j:
    bge $t1, $t0, check_prime   # Si j >= i, salir del bucle j

    div $t0, $t1    # i / j
    mfhi $t3        # Resto en $t3
    beqz $t3, not_prime  # Si i % j == 0, es NO primo

    addi $t1, $t1, 1  # j++
    j loop_j

not_prime:
    li $t2, 0       # esPrimo = false

check_prime:
    beqz $t2, next_i  # Si esPrimo == 0, saltar

    # Imprimir número primo
    move $a0, $t0
    li $v0, 1
    syscall

    # Imprimir espacio
    li $v0, 4
    la $a0, espacio
    syscall

next_i:
    addi $t0, $t0, 1  # i++
    j loop_i

end_loop:
    li $v0, 4
    la $a0, fin
    syscall

    li $v0, 10
    syscall