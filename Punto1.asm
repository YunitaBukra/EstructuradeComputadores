.data
mensaje:     .asciiz "Ingresa el primer número:"  # Mensaje para pedir el primer número
mensaje2:    .asciiz "Ingresa el segundo número:"   # Mensaje para pedir el segundo número
mensaje3:    .asciiz "Ingresa el tercer número:"    # Mensaje para pedir el tercer número
resultado:   .asciiz "El número mayor es:"          # Mensaje para acompañar la impresión del resultado

.text

main:
    # Se pide el primer número al usuario
    li $v0, 4          # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, mensaje    # Se carga la dirección del mensaje en $a0
    syscall            # Llamada al sistema para imprimir el mensaje

    # Se lee el primer número
    li $v0, 5          # Se carga el código de la llamada al sistema para leer (5) en $v0
    syscall            # Llamada al sistema para leer el número
    move $t0, $v0      # Se mueve el número ingresado a $t0

    # Se pide el segundo número al usuario
    li $v0, 4          # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, mensaje2   # Se carga la dirección del segundo mensaje en $a0
    syscall            # Llamada al sistema para imprimir el segundo mensaje

    # Se lee el segundo número
    li $v0, 5          # Se carga el código de la llamada al sistema para leer (5) en $v0
    syscall            # Llamada al sistema para leer el segundo número
    move $t1, $v0      # Se mueve el segundo número ingresado a $t1

    # Se compara el primer número con el segundo
    bge $t0, $t1, check_third  # Si el primer número es mayor o igual, se salta a verificar el tercer número

    # Si el segundo número es mayor, se actualiza el número mayor actual
    move $t0, $t1

check_third:
    # Se pide el tercer número al usuario
    li $v0, 4          # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, mensaje3   # Se carga la dirección del tercer mensaje en $a0
    syscall            # Llamada al sistema para imprimir el tercer mensaje

    # Se lee el tercer número
    li $v0, 5          # Se carga el código de la llamada al sistema para leer (5) en $v0
    syscall            # Llamada al sistema para leer el tercer número
    move $t2, $v0      # Se mueve el tercer número ingresado a $t2

    # Se compara el número mayor actual con el tercer número
    bge $t0, $t2, imprimir_resultado  # Si el número mayor actual es mayor o igual, se imprime el resultado

    # Si el tercer número es mayor, se actualiza el número mayor actual
    move $t0, $t2

imprimir_resultado:
    # Se imprime el resultado
    li $v0, 4          # Se carga el código de la llamada al sistema para imprimir (4) en $v0
    la $a0, resultado  # Se carga la dirección del mensaje de resultado en $a0
    syscall            # Llamada al sistema para imprimir el mensaje de resultado

    li $v0, 1          # Se carga el código de la llamada al sistema para imprimir un entero (1) en $v0
    move $a0, $t0      # Se mueve el número mayor a imprimir en $a0
    syscall            # Llamada al sistema para imprimir el número mayor

    # Salir del programa
    li $v0, 10         # Se carga el código de la llamada al sistema para salir (10) en $v0
    syscall            # Llamada al sistema para salir del programa
