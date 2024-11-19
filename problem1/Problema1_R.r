# Definir registros como una lista de listas
estudiantes <- list(
  list(nombre = "Alice", edad = 20, calificacion = 85),
  list(nombre = "Bob", edad = 19, calificacion = 90),
  list(nombre = "Charlie", edad = 22, calificacion = 78),
  list(nombre = "Diana", edad = 21, calificacion = 88)
)

# Implementación de MergeSort
merge_sort <- function(lista) {
  if (length(lista) <= 1) {
    return(lista)
  }
  
  mid <- length(lista) %/% 2
  izquierda <- merge_sort(lista[1:mid])
  derecha <- merge_sort(lista[(mid+1):length(lista)])
  
  merge <- function(izquierda, derecha) {
    resultado <- list()
    while (length(izquierda) > 0 && length(derecha) > 0) {
      if (izquierda[[1]]$edad <= derecha[[1]]$edad) {  # Ordenar por edad
        resultado <- append(resultado, list(izquierda[[1]]))
        izquierda <- izquierda[-1]
      } else {
        resultado <- append(resultado, list(derecha[[1]]))
        derecha <- derecha[-1]
      }
    }
    c(resultado, izquierda, derecha)
  }
  
  merge(izquierda, derecha)
}

# Llamada al algoritmo
estudiantes <- merge_sort(estudiantes)

# Mostrar resultados
for (estudiante in estudiantes) {
  print(paste(estudiante$nombre, "Edad:", estudiante$edad, "Calificación:", estudiante$calificacion))
}
