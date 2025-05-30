# MARCOS BARBUZANO SOCORRO
# 3/4/25

# #include <iostream>
# #include <iomanip>
# #include <cmath>

# const int MAXELTOS = 100;

# typedef struct {
#   int nFil;
#   int nCol;
#   float elementos[MAXELTOS];
# } structMat;


# structMat mat1 {
#   6,
#   6,
#   {
#     11.11, 12.12, 13.13, 14.14, 15.15, 16.16,
#     21.21, 22.22, 23.23, 24.24, 25.25, 26.26,
#     31.31, 32.32, 33.33, 34.34, 35.35, 36.36,
#     41.41, 42.42, 43.43, 44.44, 45.45, 46.46,
#     51.51, 52.52, 53.53, 54.54, 55.55, 56.56,
#     61.61, 62.62, 63.63, 64.64, 65.65, 66.66
#   }
# };

# structMat mat2 {
#   7,
#   10,
#   {
#     -36.886, -58.201,  78.671,  19.092, -50.781,  33.961, -59.511, 12.3125,
#     57.306,  -1.938, -86.858, -81.852,  54.623, -22.574,  88.217,  64.374,
#     52.875, 47.918, -83.549,  19.041, 4.255, -31.875,  82.526,  27.394,
#     56.527,  39.448,  18.429, 97.057,  76.933,  14.583, 67.79, -9.861,
#     -97.875,  32.369, -18.494, -43.392,  39.857, 87.65625, -31.875 , -17.786,
#     30.073,  87.65625,  -6.889,  64.601, -85.018,  70.559, -48.853, -62.627,
#     -60.147,  -5.524, 84.323, -51.718,  93.127, -10.757,  32.119, 98.3125,
#     69.471, 73.814,   3.724,  57.208, -41.528, -17.458, -64.226, -71.297,
#     -97.875,   7.095, -79.112, 33.819,  63.531, -96.181
#   }
# };

# structMat mat3 {
#   1,
#   8,
#   {
#     -36.52,  35.3 ,  79.05, -58.69, -55.23, -19.44, -88.63, -93.61
#   }
# };

# structMat mat4 {
#   16,
#   1,
#   { -90.57, -65.11, -58.21, -73.23, -89.38, -79.25,  16.82,  66.3 ,
#     -96.14, -97.16, -24.66,   5.27, -33.5 , -13.09,  27.13, -74.83 }
# };

# structMat mat5 {
#   1,
#   1,
#   { 78.98 }
# };

# structMat mat6 {
#   0,
#   0,
#   { 0 }
# };

# // Matriz de acceso libre para modificar
# structMat mat7 {
#   0,
#   0,
#   // Inicializamos los MAXELTOS primeros elementos a 0
#   { 0 }
# };

# int main() {
#   std::cout << std::fixed << std::setprecision(8);  // Ignorar
#   std::cout << "\nComienza programa manejo matrices\n";

#   structMat* matTrabajo = &mat1;
#   while(true) {
#     int numCol = matTrabajo->nCol;
#     int numFil = matTrabajo->nFil;
#     float* datos = matTrabajo->elementos;
#     std::cout << "\n\nLa matriz tiene dimension " << numFil<< 'x'
#               << numCol << '\n';
#     for(int f = 0; f < numFil; f++) {
#       for(int c = 0; c < numCol; c++) {
#         std::cout << datos[f*numCol + c] << ' ';
#       }
#       std::cout << '\n';
#     }
#     std::cout << '\n';
#     std::cout <<
#     "(0) Terminar el programa\n"
#     "(1) Cambiar la matriz de trabajo\n"
#     "(2) Definir matriz 7\n"
#     "(3) Cambiar un valor de la matriz\n"
#     "(7) Contar valores superiores a un umbral\n"
#     "\nIntroduce opción elegida: ";

#     int opcion;
#     std::cin >> opcion;


#     if(opcion == 0) {
#       break;
#     }

#     // Opción 1 ////////////////////////////////////////////////////////////
#     if(opcion == 1) {
#       std::cout << "\nElije la matriz de trabajo (1..7): ";
#       int matT;
#       std::cin >> matT;
#       switch(matT) {
#         case 1:
#           matTrabajo = &mat1;
#           break;
#         case 2:
#           matTrabajo = &mat2;
#           break;
#         case 3:
#           matTrabajo = &mat3;
#           break;
#         case 4:
#           matTrabajo = &mat4;
#           break;
#         case 5:
#           matTrabajo = &mat5;
#           break;
#         case 6:
#           matTrabajo = &mat6;
#           break;
#         case 7:
#           matTrabajo = &mat7;
#           break;
#         default:
#           std::cout << "Numero de matriz de trabajo incorrecto\n";
#           continue;  // volvemos al principio del bucle
#       }
#       continue;
#     }

#     // Opción 2: Definir matriz 7 //////////////////////////////////////////
#     if (opcion == 2) {
#       int nFil;
#       int nCol; // numero de columnas
#       std::cout << "Introduce el numero de filas: ";
#       std::cin >> nFil;
#       if (nFil < 1 || nFil > MAXELTOS) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de filas incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
#       std::cout << "Introduce el numero de columnas: ";
#       std::cin >> nCol;
#       if (nCol < 1 || nCol > MAXELTOS) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de columnas incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
#       if (nFil * nCol > MAXELTOS) {
#         std::cout << "Error: dimension incorrecta.  Demasiados elementos\n";
#         continue;  // volvemos al principio del bucle
#       }

#       // inicializa la matriz 7 con los valores introducidos
#       mat7.nFil = nFil;
#       mat7.nCol = nCol;
#       // solicitar los valores de los elementos de la matriz por filas
#       for(int f = 0; f < nFil; f++) {
#         for(int c = 0; c < nCol; c++) {
#           std::cout << "Introduce el elemento (" << f << ',' << c << "): ";
#           std::cin >> mat7.elementos[f * nCol + c];
#         }
#       }
#       continue;
#     }

#     // Opción 3  //////////////////////////////////////////////////////////
#     if(opcion == 3) {
#       std::cout << "\nIndice de fila: ";
#       int indFil;
#       std::cin >> indFil;
#       if ((indFil < 0) || (indFil >= numFil)) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de fila incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
#       std::cout << "Indice de columna: ";
#       int indCol;
#       std::cin >> indCol;
#       if ((indCol < 0) || (indCol >= numCol)){
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de columna incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
#       std::cout << "Nuevo valor para el elemento: ";
#       float valor;
#       std::cin >> valor;
#       // cambiar el valor de la matriz de trabajo en la posicion introducida
#       datos[indFil * numCol + indCol] = valor;
#       continue;
#     }

#     // Opción 7 ////////////////////////////////////////////////////////////
#     if(opcion == 7) {
#       std::cout << "Introduce el umbral: ";
#       float umbral;
#       std::cin >> umbral;
#       int contador = 0;
#       for(int f = 0; f < numFil; f++) {
#         for(int c = 0; c < numCol; c++) {
#           float valor = datos[f * numCol + c];
#           if (valor > umbral) {
#             contador++;
#           }
#         }
#       }
#       std::cout << "\nNumero de valores superiores al umbral: " << contador;

#       continue;
#     }

#     // Opción Incorrecta ///////////////////////////////////////////////////
#     std::cout << "Error: opcion incorrecta\n";
#   }
#   std::cout << "\nTermina el programa\n";
# }

MAXELTOS=100 # numero maximo de elemenos
nFil=0 # desplazamiento al campo filas
nCol=4 # desplazamiento al campo columnas
elementos=8 # desplazamiento datos matriz
sizeF=4 # numero de bytes que ocupa un flotante
  .data

mat1: .word 6
      .word 6
      .float 11.11, 12.12, 13.13, 14.14, 15.15, 16.16
      .float 21.21, 22.22, 23.23, 24.24, 25.25, 26.26
      .float 31.31, 32.32, 33.33, 34.34, 35.35, 36.36
      .float 41.41, 42.42, 43.43, 44.44, 45.45, 46.46
      .float 51.51, 52.52, 53.53, 54.54, 55.55, 56.56
      .float 61.61, 62.62, 63.63, 64.64, 65.65, 66.66

mat2: .word 7
      .word 10
      .float -36.886, -58.201, 78.671, 19.092, -50.781, 33.961, -59.511
      .float 12.3125, 57.306, -1.938, -86.858, -81.852,  54.623, -22.574
      .float 88.217, 64.374, 52.875, 47.918, -83.549,  19.041, 4.255, -31.875
      .float 82.526,  27.394, 56.527, 39.448,  18.429, 97.057,  76.933
      .float 14.583, 67.79, -9.861, -97.875, 32.369, -18.494, -43.392, 39.857 
      .float 87.65625, -31.875, -17.786, 30.073,  87.65625,  -6.889,  64.601
      .float -85.018,  70.559, -48.853, -62.627, -60.147,  -5.524, 84.323
      .float -51.718,  93.127, -10.757,  32.119, 98.3125, 69.471, 73.814
      .float 3.724,  57.208, -41.528, -17.458, -64.226, -71.297, -97.875
      .float 7.095, -79.112, 33.819,  63.531, -96.181

mat3:
      .word 1
      .word 8
      .float -36.52,  35.3 ,  79.05, -58.69, -55.23, -19.44, -88.63, -93.61

mat4:
      .word 16
      .word 1
      .float -90.57, -65.11, -58.21, -73.23, -89.38, -79.25,  16.82,  66.3
      .float -96.14, -97.16, -24.66,   5.27, -33.5 , -13.09,  27.13, -74.83

mat5:
      .word 1
      .word 1
      .float 78.98

mat6:
      .word 0
      .word 0
      .float 0.0

mat7: .word 0
      .word 0
      .space MAXELTOS*sizeF

titulo: .asciiz "\nComienza programa manejo matrices\n"
dimstr: .asciiz "\n\nLa matriz tiene dimension "
xstr:   .asciiz "x"
menu:   .ascii "(0) Terminar el programa\n"
        .ascii "(1) Cambiar la matriz de trabajo\n"
        .ascii "(2) Definir matriz 7\n"
        .ascii "(3) Cambiar un valor de la matriz\n"
        .ascii "(7) Contar valores superiores a un umbral\n"
        .asciiz "\nIntroduce opción elegida: ";
petmat: .asciiz "\nElije la matriz de trabajo (1..7): "
errmat: .asciiz "Numero de matriz de trabajo incorrecto\n"
petnf:  .asciiz "Introduce el numero de filas: ";
errnf:  .asciiz "Error: dimension incorrecta.  Numero de filas incorrecto\n"
petnc:  .asciiz "Introduce el numero de columnas: "
errnc:  .asciiz "Error: dimension incorrecta.  Numero de columnas incorrecto\n"
errmax: .asciiz "Error: dimension incorrecta.  Demasiados elementos\n"
petel:  .asciiz "Introduce el elemento (" 
petcom: .asciiz ","
petel2: .asciiz "): "
petfil: .asciiz "\nIndice de fila: "
errfil: .asciiz "Error: dimension incorrecta.  Numero de fila incorrecto\n" 
petcol: .asciiz "Indice de columna: "
errcol: .asciiz "Error: dimension incorrecta.  Numero de columna incorrecto\n"
petval: .asciiz "Nuevo valor para el elemento: "
petum:  .asciiz "Introduce el umbral: "
umbstr: .asciiz "\nNumero de valores superiores al umbral: "
erropc: .asciiz "Error: opcion incorrecta\n"
finstr: .asciiz "\nTermina el programa\n"
endl:	.asciiz "\n" 
space: 	.asciiz " "

######### REGISTROS #########
######### CONSTANTES ########
# Estos registros no cambian en las opciones
# $s0 ---> numFil
# $s1 ---> numCol
# $s2 ---> matTrabajo
# $s3 ---> elementos
# $s4 ---> matT



# $s6 ---> f (iterador de filas)
# $s7 ---> c (iterador de columnas)
# estos dos últimos se usan en bucles que contienen llamadas al sistema,
# aunque también en la creación de la matriz 7 en la opción 2 como nFil y nCol
# en la opción tres pasan a ser indFil e indCol
# en la opción 7 vuelven a pasar a ser f y c

.text

main:
# int main() {
#   std::cout << std::fixed << std::setprecision(8);  // Ignorar
#   std::cout << "\nComienza programa manejo matrices\n";
        li $v0, 4
        la $a0, titulo
        syscall

#   structMat* matTrabajo = &mat1;
        la $s2, mat1

while:
#   while(true) {
#     int numCol = matTrabajo->nCol;
#     int numFil = matTrabajo->nFil;
	lw $s0, nFil($s2)
	lw $s1, nCol($s2)

#     float* datos = matTrabajo->elementos;
	la $s3, elementos($s2)

#     std::cout << "\n\nLa matriz tiene dimension " << numFil<< 'x'
#               << numCol << '\n';
	li $v0, 4
	la $a0, dimstr
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	li $v0, 4
	la $a0, xstr
	syscall

	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, endl
	syscall

	li $s6, 0 # interadores para la impresión

for_print_fil:
#     for(int f = 0; f < numFil; f++) {
#       for(int c = 0; c < numCol; c++) {
#         std::cout << datos[f*numCol + c] << ' ';
#       }
	bge $s6, $s0, for_print_fin
	li $s7, 0

	for_print_col:

		bge $s7, $s1, for_print_col_fin

		mul $t0, $s6, $s1   # f * numCol
		add $t0, $t0, $s7   # f * numCol + c
		mul $t0, $t0, 4     # (f * numCol + c) * 4 (cada entero ocupa 4 bytes)
		add $t0, $s2, $t0   # Dirección base + desplazamiento

		l.s $f12, 8($t0)
		li $v0, 2
		syscall

		li $v0, 4
		la $a0, space
		syscall

		addi $s7, 1
		b for_print_col

	for_print_col_fin:

		li $v0, 4
		la $a0, endl
		syscall

		addi $s6, 1
		b for_print_fil

for_print_fin:
	li $v0, 4
	la $a0, endl
	syscall

menu_opciones:
#     std::cout <<
#     "(0) Terminar el programa\n"
#     "(1) Cambiar la matriz de trabajo\n"
#     "(2) Definir matriz 7\n"
#     "(3) Cambiar un valor de la matriz\n"
#     "(7) Contar valores superiores a un umbral\n"
#     "\nIntroduce opción elegida: ";
	li $v0, 4
	la $a0, menu
	syscall

#     int opcion;
#     std::cin >> opcion;
	li $v0, 5
	syscall
	move $t0, $v0

	beqz $t0, opcion_cero
	beq $t0, 1, opcion_uno
	beq $t0, 2, opcion_dos
	beq $t0, 3, opcion_tres
	beq $t0, 7, opcion_siete
	b opcion_incorrecta

opcion_cero:
#     if(opcion == 0) {
#       break;
#     }
b fin_programa

opcion_uno:
#     // Opción 1 ////////////////////////////////////////////////////////////
#     if(opcion == 1) {
#       std::cout << "\nElije la matriz de trabajo (1..7): ";
#       int matT;
#       std::cin >> matT;
	li $v0, 4
	la $a0, petmat
	syscall

	li $v0, 5
	syscall
	move $s4, $v0

#       switch(matT) {
#         case 1:
#           matTrabajo = &mat1;
#           break;
#         case 2:
#           matTrabajo = &mat2;
#           break;
#         case 3:
#           matTrabajo = &mat3;
#           break;
#         case 4:
#           matTrabajo = &mat4;
#           break;
#         case 5:
#           matTrabajo = &mat5;
#           break;
#         case 6:
#           matTrabajo = &mat6;
#           break;
#         case 7:
#           matTrabajo = &mat7;
#           break;
#         default:
#           std::cout << "Numero de matriz de trabajo incorrecto\n";
#           continue;  // volvemos al principio del bucle
#       }
#       continue;
#     }

	blt $s4, 1, seleccion_incorrecta
	bgt $s4, 7, seleccion_incorrecta
	beq $s4, 1, matriz_uno
	beq $s4, 2, matriz_dos
	beq $s4, 3, matriz_tres
	beq $s4, 4, matriz_cuatro
	beq $s4, 5, matriz_cinco
	beq $s4, 6, matriz_seis
	beq $s4, 7, matriz_siete

matriz_uno:
	la $s2, mat1
   	 j switch_fin

matriz_dos:
   	 la $s2, mat2
   	 j switch_fin

matriz_tres:
   	 la $s2, mat3
   	 j switch_fin

matriz_cuatro:
    	la $s2, mat4
   	 j switch_fin

matriz_cinco:
   	 la $s2, mat5
  	  j switch_fin

matriz_seis:
 	   la $s2, mat6
  	  j switch_fin

matriz_siete:
  	  la $s2, mat7
   	 j switch_fin

seleccion_incorrecta:

	li $v0, 4
	la $a0, errmat
	syscall

switch_fin:
	j while

	
opcion_dos:
#     // Opción 2: Definir matriz 7 //////////////////////////////////////////
#     if (opcion == 2) {
#       int nFil;
#       int nCol; // numero de columnas
#       std::cout << "Introduce el numero de filas: ";
#       std::cin >> nFil;
numero_filas:
	li $v0, 4
	la $a0, petnf
	syscall

	li $v0, 5
	syscall
	move $s6, $v0

#       if (nFil < 1 || nFil > MAXELTOS) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de filas incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
	blt $s6, 1, error_nfilas
	bgt $s6, MAXELTOS, error_nfilas
	b numero_columnas

error_nfilas:

	li $v0, 4
	la $a0, errnf
	syscall

	j while

numero_columnas:
#       std::cout << "Introduce el numero de columnas: ";
#       std::cin >> nCol;
#       if (nCol < 1 || nCol > MAXELTOS) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de columnas incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
	li $v0, 4
	la $a0, petnc
	syscall

	li $v0, 5
	syscall
	move $s7, $v0

	blt $s7, 1, error_ncolumnas
	bgt $s7, MAXELTOS, error_ncolumnas
	b if_maximo

error_ncolumnas:

	li $v0, 4
	la $a0, errnc
	syscall

	j while

if_maximo:
#       if (nFil * nCol > MAXELTOS) {
#         std::cout << "Error: dimension incorrecta.  Demasiados elementos\n";
#         continue;  // volvemos al principio del bucle
#       }
	mul $t0, $s6, $s7
	blt $t0, MAXELTOS, if_max_fin

	li $v0, 4
	la $a0, errmax
	syscall

	j while

if_max_fin: # en este punto vamos a usar $s4 y $s5 como f y c

#       // inicializa la matriz 7 con los valores introducidos
#       mat7.nFil = nFil;
#       mat7.nCol = nCol;
#       // solicitar los valores de los elementos de la matriz por filas
#       for(int f = 0; f < nFil; f++) {
#         for(int c = 0; c < nCol; c++) {
#           std::cout << "Introduce el elemento (" << f << ',' << c << "): ";
#           std::cin >> mat7.elementos[f * nCol + c];
#         }
#       }
#       continue;
#     }

	la $s3, mat7
	sw $s6, nFil($s3)
	sw $s7, nCol($s3)

	li $s4, 0

for_filas:

	bge $s4, $s6, for_filas_fin
	li $s5, 0

	for_columnas:
		bge $s5, $s7, for_columnas_fin

		li $v0, 4
		la $a0, petel
		syscall

		li $v0, 1
		move $a0, $s4
		syscall

		li $v0, 4
		la $a0, petcom
		syscall

		li $v0, 1
		move $a0, $s5
		syscall

		li $v0, 4
		la $a0, petel2
		syscall

		li $v0, 6
		syscall
		mov.s $f20, $f0

		mul $t0, $s4, $s7 	# f * nCol
		add $t0, $t0, $s5 	# f * nCol + c
		mul $t0, $t0, sizeF     # Cada elemento es de 4 bytes
		add $t0, $t0, $s3   # Añadir la dirección base de mat7
		addi $t0, $t0, elementos		# añadir los espacios de nfil y ncol
		s.s $f20, 0($t0)   	# Almacenar el valor en la dirección calculada

		addi $s5, 1
		b for_columnas
	for_columnas_fin:


	addi $s4, 1
	b for_filas

for_filas_fin:

	j while


opcion_tres:
#     // Opción 3  //////////////////////////////////////////////////////////
#     if(opcion == 3) {
#       std::cout << "\nIndice de fila: ";
#       int indFil;
#       std::cin >> indFil;
#       if ((indFil < 0) || (indFil >= numFil)) {
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de fila incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
indice_fila:
	li $v0, 4
	la $a0, petfil
	syscall

	li $v0, 5
	syscall
	move $s6, $v0

	bltz $s6, error_indfil
	bge $s6, $s0, error_indfil
	b indice_columna

error_indfil:

	li $v0, 4
	la $a0, errfil
	syscall

	j while

indice_columna:
#       std::cout << "Indice de columna: ";
#       int indCol;
#       std::cin >> indCol;
#       if ((indCol < 0) || (indCol >= numCol)){
#         std::cout <<
#           "Error: dimension incorrecta.  Numero de columna incorrecto\n";
#         continue;  // volvemos al principio del bucle
#       }
	li $v0, 4
	la $a0, petcol
	syscall

	li $v0, 5
	syscall
	move $s7, $v0

	bltz $s7, error_indcol
	bge $s7, $s1, error_indcol
	b nuevo_valor

error_indcol:

	li $v0, 4
	la $a0, errcol
	syscall

	j while

nuevo_valor:
#       std::cout << "Nuevo valor para el elemento: ";
#       float valor;
#       std::cin >> valor;
#       // cambiar el valor de la matriz de trabajo en la posicion introducida
#       datos[indFil * numCol + indCol] = valor;
#       continue;
#     }
	li $v0, 4
	la $a0, petval
	syscall

	li $v0, 6
	syscall
	mov.s $f20, $f0

	mul $t0, $s6, $s1	
	add $t0, $t0, $s7 	
	mul $t0, $t0, sizeF      # Cada elemento es de 4 bytes
	add $t0, $t0, $s2        # Añadir la dirección base de mat7
	addi $t0, $t0, elementos # añadir los espacios de nfil y ncol
	s.s $f20, 0($t0)   	 # Almacenar el valor en la dirección calculada

	j while


opcion_siete:
#     // Opción 7 ////////////////////////////////////////////////////////////
#     if(opcion == 7) {
#       std::cout << "Introduce el umbral: ";
#       float umbral;
#       std::cin >> umbral;
#       int contador = 0;
#       for(int f = 0; f < numFil; f++) {
#         for(int c = 0; c < numCol; c++) {
#           float valor = datos[f * numCol + c];
#           if (valor > umbral) {
#             contador++;
#           }
#         }
#       }
#       std::cout << "\nNumero de valores superiores al umbral: " << contador;

#       continue;
#     }
	li $v0, 4
	la $a0, petum
	syscall

	li $v0, 6
	syscall
	mov.s $f20, $f0

	li $s5, 0 # Contador
	li $s6, 0 # f

for_filas_umbral:
	bge $s6, $s0, for_filas_umbral_fin

	li $s7, 0 # c

	for_columnas_umbral:
		bge $s7, $s1, for_columnas_umbral_fin

		mul $t0, $s6, $s1 	 # f * numCol
		add $t0, $t0, $s7 	 # f * numCol + c
		mul $t0, $t0, sizeF	 # 4 bytes por elemento
		add $t0, $t0, $s2	 # dir.matriz + desplazamiento
		addi $t0, $t0, elementos # desplazado a elementos
		l.s $f21, 0($t0)	 # extracción del valor

	if_umbral:

		c.le.s $f21, $f20
		bc1t umbral_no

		addi $s5, 1 #aumento del contador

		umbral_no:

		addi $s7, 1
		b for_columnas_umbral

	for_columnas_umbral_fin:

		addi $s6, 1
		b for_filas_umbral


for_filas_umbral_fin:

	li $v0, 4
	la $a0, umbstr
	syscall

	li $v0, 1
	move $a0, $s5
	syscall

	j while


opcion_incorrecta:
#     // Opción Incorrecta ///////////////////////////////////////////////////
#     std::cout << "Error: opcion incorrecta\n";
	li $v0, 4
	la $a0, erropc
	syscall

	j while

fin_programa:
#   std::cout << "\nTermina el programa\n";
# }
  	li $v0, 4
  	la $a0, finstr
  	syscall

  	li $v0, 10
  	syscall