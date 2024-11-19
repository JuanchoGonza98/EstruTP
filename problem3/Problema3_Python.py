# Multiplicación manual de matrices
def multiplicar_matrices(A, B):
    filas_A = len(A)
    columnas_A = len(A[0])
    filas_B = len(B)
    columnas_B = len(B[0])

    # Verificar compatibilidad de dimensiones
    if columnas_A != filas_B:
        raise ValueError("Las dimensiones de las matrices no son compatibles para la multiplicación.")

    # Crear matriz resultado con ceros
    resultado = [[0 for _ in range(columnas_B)] for _ in range(filas_A)]

    # Multiplicación manual
    for i in range(filas_A):
        for j in range(columnas_B):
            for k in range(columnas_A):
                resultado[i][j] += A[i][k] * B[k][j]

    return resultado

# Prueba
A = [
    [1, 2, 3],
    [4, 5, 6]
]

B = [
    [7, 8],
    [9, 10],
    [11, 12]
]

try:
    resultado = multiplicar_matrices(A, B)
    for fila in resultado:
        print(fila)
except ValueError as e:
    print(f"Error: {e}")

import numpy as np
resultado = np.dot(A, B)
print(resultado)
