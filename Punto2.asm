.data
prompt:     .asciiz "Ingresa el primer número: "  # Mensaje para pedir el primer número
prompt2:    .asciiz "Ingresa el segundo número: " # Mensaje para pedir el segundo número
prompt3:    .asciiz "Ingresa el tercer número: "  # Mensaje para pedir el tercer número
result:     .asciiz "El número menor es: "        # Mensaje para acompañar la impresión del resultado

.text
.globl main

main:
    # Se imprime el primer prompt y leer el primer número
    li $v0, 4         # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, prompt    # Se carga la dirección del primer mensaje en $a0
    syscall           # Llamada al sistema para imprimir el primer mensaje

    li $v0, 5         # Se carga el código de la llamada al sistema para leer un entero (5) en $v0
    syscall           # Llamada al sistema para leer el primer número ingresado
    move $t0, $v0     # Se Mueve el valor leído a $t0

    # Se imprime el segundo prompt y leer el segundo número
    li $v0, 4         # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a1, prompt2   # Se carga la dirección del segundo mensaje en $a1
    syscall           # Llamada al sistema para imprimir el segundo mensaje

    li $v0, 5         # Se carga el código de la llamada al sistema para leer un entero (5) en $v0
    syscall           # Llamada al sistema para leer el segundo número ingresado
    move $t1, $v0     # Se Mueve el valor leído a $t1

    # Se imprime el tercer prompt y leer el tercer número
    li $v0, 4         # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a2, prompt3   # Se carga la dirección del tercer mensaje en $a2
    syscall           # Llamada al sistema para imprimir el tercer mensaje

    li $v0, 5         # Se carga el código de la llamada al sistema para leer un entero (5) en $v0
    syscall           # Llamada al sistema para leer el tercer número ingresado
    move $t2, $v0     # Se Mueve el valor leído a $t2

    # Se encuentra el número menor
    move $t3, $t0     # Copiar el primer número a $t3
    ble $t3, $t1, check_t1  # Comparar con el segundo número y saltar si es menor o igual

    move $t3, $t1     # Si el segundo número es menor, actualizar el número menor en $t3

check_t1:
    ble $t3, $t2, print_result  # Comparar con el tercer número y saltar si es menor o igual

    move $t3, $t2     # Si el tercer número es menor, actualizar el número menor en $t3

print_result:
    # Se imprime el resultado
    li $v0, 4         # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, result    # Se carga la dirección del mensaje de resultado en $a0
    syscall           # Llamada al sistema para imprimir el mensaje de resultado

    move $a0, $t3     # Mover el número menor a $a0
    li $v0, 1         # Se carga el código de la llamada al sistema para imprimir un entero (1) en $v0
    syscall           # Llamada al sistema para imprimir el número menor

    # Salir del programa
    li $v0, 10        # Se carga el código de la llamada al sistema para salir (10) en $v0
    syscall           # Llamada al sistema para salir del programa
