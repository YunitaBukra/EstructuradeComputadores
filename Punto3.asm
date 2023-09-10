.data
output_prompt: .asciiz "Ingrese el número de términos en la secuencia de Fibonacci: "  # Mensaje para pedir el numero de miembros
result_prompt: .asciiz "Secuencia de Fibonacci: "  # Mensaje para acompañar la impresión del resultado

.text
.globl main

main:
    # Se pide el número de términosal usuario
    li $v0, 4            # Se carga el código de llamada del sistema para imprimir un mensaje
    la $a0, output_prompt  # Se carga la dirección del mensaje de solicitud
    syscall              # Llamada al sistema para imprimir el mensaje

    # Se lee el número de términos ingresado por el usuario
    li $v0, 5            # Se carga el código de llamada del sistema para leer un entero
    syscall              # Llamada al sistema para leer un entero
    move $t0, $v0        # Se mueve el número ingresado a $t0

    # Se inicializa la secuencia de Fibonacci
    li $t1, 0            # El primer término (F(0)) es 0
    li $t2, 1            # El segundo término (F(1)) es 1

    # Se imprime el mensaje de resultado
    li $v0, 4            # Se carga el código de llamada del sistema para imprimir un mensaje
    la $a0, result_prompt  # Cargar la dirección del mensaje de resultado
    syscall              # Llamada al sistema para imprimir el mensaje

    # Se imprimen los dos primeros términos (0 y 1)
    li $v0, 1            # Se carga el código de llamada del sistema para imprimir un entero
    move $a0, $t1        # Se carga el primer término en $a0
    syscall              # Llamada al sistema para imprimir

    li $v0, 1            # Se carga el código de llamada del sistema para imprimir un entero
    move $a0, $t2        # Se carga el segundo término en $a0
    syscall              # Llamada al sistema para imprimir

    # S genera e imprime la secuencia de Fibonacci
    addi $t0, $t0, -2    # Se ajusta el número de términos para generar la secuencia restante

fib_loop:
    # Se calcula el siguiente término en la secuencia (F(n) = F(n-1) + F(n-2))
    add $t3, $t1, $t2    # $t3 = F(n-1) + F(n-2)

    # Se imprime el siguiente término
    li $v0, 1            # Se carga el código de llamada del sistema para imprimir un entero
    move $a0, $t3        # Se carga el siguiente término en $a0
    syscall              # Llamada al sistema para imprimir

    # Se actualizan $t1 y $t2 para la próxima iteración
    move $t1, $t2        # Se mueve el valor de $t2 a $t1 (F(n-2) a F(n-1))
    move $t2, $t3        # Se mueve el valor de $t3 a $t2 (F(n-1) a F(n))

    addi $t0, $t0, -1    # Se decrementar el número de términos restantes

    # Se comprueba si se deben generar más términos
    bnez $t0, fib_loop    # Se Salta a fib_loop si $t0 no es cero (más términos)

    # Salir del programa
    li $v0, 10           # Se carga el código de llamada del sistema para salir del programa
    syscall              # Llamada al sistema para salir