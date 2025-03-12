#// Programa para evaluar polinomio tercer grado

# #include <iostream>
# #include <iomanip>

# int main(void) {
#   std::cout << std::fixed << std::setprecision(8);  // Ignorar
#   float a,b,c,d;
#   std::cout << "\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
#             << " en un intervalo [r,s]\n";
#   std::cout << "\nIntroduzca coeficiente a: ";
#   std::cin >> a;
#   std::cout << "Introduzca coeficiente b: ";
#   std::cin >> b;
#   std::cout << "Introduzca coeficiente c: ";
#   std::cin >> c;
#   std::cout << "Introduzca coeficiente d: ";
#   std::cin >> d;
#   int r,s;
#   do {
#     std::cout << "\nLímite inferior r: ";
#     std::cin >> r;
#     std::cout << "Límite superior s: ";
#     std::cin >> s;
#   } while (r > s);

#   for (int x = r ; x <= s ; x++) {
#     // float f = x*x*x*a + x*x*b + x*c + d;
#     float f = d;
#     f += x*c;
#     f += x*x*b;
#     f += x*x*x*a;
#     if (f >= 2.5) {
#       std::cout << "\nf(" << x << ") = " << f;
#     }
#   }
#   std::cout << "\n\nTermina el programa\n";
# }

# MARCOS BARBUZANO SOCORRO

.data
strTitulo: .ascii "\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
.asciiz " en un intervalo [r,s]\n"
strIntroA: .asciiz "\nIntroduzca coeficiente a: "
strIntroB: .asciiz "Introduzca coeficiente b: "
strIntroC: .asciiz "Introduzca coeficiente c: "
strIntroD: .asciiz "Introduzca coeficiente d: "

strIntroR: .asciiz "\nLímite inferior r: "
strIntroS: .asciiz "Límite superior s: "

strF: .asciiz "\nf("
strIgual: .asciiz ") = "
strTermina: .asciiz "\n\nTermina el programa\n"

# TABLA DE REGISTRO
# a $f20
# b $f21
# c $f22
# d $f23
# f $f24
# x.s $f25

# r $s0
# s $s1
# x $s2

.text

#   std::cout << "\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
#             << " en un intervalo [r,s]\n";

main:
	li $v0, 4
	la $a0, strTitulo
	syscall

#   std::cout << "\nIntroduzca coeficiente a: ";
#   std::cin >> a;
#   std::cout << "Introduzca coeficiente b: ";
#   std::cin >> b;
#   std::cout << "Introduzca coeficiente c: ";
#   std::cin >> c;
#   std::cout << "Introduzca coeficiente d: ";
#   std::cin >> d;

	li $v0, 4
	la $a0, strIntroA
	syscall

	li $v0, 6
	syscall
	mov.s $f20, $f0

	li $v0, 4
	la $a0, strIntroB
	syscall

	li $v0, 6
	syscall
	mov.s $f21, $f0

	li $v0, 4
	la $a0, strIntroC
	syscall

	li $v0, 6
	syscall
	mov.s $f22, $f0

	li $v0, 4
	la $a0, strIntroD
	syscall

	li $v0, 6
	syscall
	mov.s $f23, $f0

#   do {
#     std::cout << "\nLímite inferior r: ";
#     std::cin >> r;
#     std::cout << "Límite superior s: ";
#     std::cin >> s;
#   } while (r > s);

dowhile:
	li $v0, 4
	la $a0, strIntroR
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 4
	la $a0, strIntroS
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	bgt $s0, $s1, dowhile

#   for (int x = r ; x <= s ; x++) {
#     // float f = x*x*x*a + x*x*b + x*c + d;
#     float f = d;
#     f += x*c;
#     f += x*x*b;
#     f += x*x*x*a;
#     if (f >= 2.5) {
#       std::cout << "\nf(" << x << ") = " << f;
#     }
#   }

	move $s2, $s0
for:
	mov.s $f24, $f23 # f = d

	mtc1 $s2, $f25
	cvt.s.w $f25, $f25 # X punto flotante

#     f += x*c;
	mul.s $f4, $f23, $f25
	add.s $f24, $f24, $f4

#     f += x*x*b;
	mul.s $f4, $f25, $f25 # $f4 = x²
	mul.s $f5, $f4, $f21
	add.s $f24, $f24, $f5

#     f += x*x*x*a;
	mul.s $f4, $f4, $f25 # $f4 = x³
	mul.s $f5, $f20, $f4
	add.s $f24, $f24, $f5

	li.s $f4, 2.5
	c.le.s $f24, $f4, cout

vuelta:

	addi $s2, 1
	ble $s2, $s1, for

cout:
	# Imprimir "f("
	li $v0, 4
	la $a0, strF
	syscall

	# Imprimir x
	li $v0, 1
	move $a0, $s2
	syscall

	# Imprimir ") = "
	li $v0, 4
	la $a0, strIgual
	syscall

	# Imprimir f(x)
	li $v0, 2
	mov.s $f12, $f24
	syscall
	
	b vuelta


fin:
	li $v0, 4
	la $a0, strTermina
	syscall

	li $v0, 10
	syscall
