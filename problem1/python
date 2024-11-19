# Definición de la estructura
class Estudiante:
    def __init__(self, nombre, edad, calificacion):
        self.nombre = nombre
        self.edad = edad
        self.calificacion = calificacion

# Lista de registros
estudiantes = [
    Estudiante("Alice", 20, 85),
    Estudiante("Bob", 19, 90),
    Estudiante("Charlie", 22, 78),
    Estudiante("Diana", 21, 88)
]

# Implementación de MergeSort
def merge_sort(lista):
    if len(lista) > 1:
        mid = len(lista) // 2
        izquierda = lista[:mid]
        derecha = lista[mid:]

        merge_sort(izquierda)
        merge_sort(derecha)

        i = j = k = 0
        while i < len(izquierda) and j < len(derecha):
            if izquierda[i].edad <= derecha[j].edad:  # Ordenar por edad
                lista[k] = izquierda[i]
                i += 1
            else:
                lista[k] = derecha[j]
                j += 1
            k += 1

        while i < len(izquierda):
            lista[k] = izquierda[i]
            i += 1
            k += 1

        while j < len(derecha):
            lista[k] = derecha[j]
            j += 1
            k += 1

# Llamada al algoritmo
merge_sort(estudiantes)

# Mostrar resultados
for estudiante in estudiantes:
    print(f"{estudiante.nombre}, Edad: {estudiante.edad}, Calificación: {estudiante.calificacion}")
