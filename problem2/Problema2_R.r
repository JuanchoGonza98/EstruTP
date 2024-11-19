# Definir registros como una lista de listas
productos <- list(
  list(nombre = "Arroz", precio = 50, cantidad = 20),
  list(nombre = "Harina", precio = 30, cantidad = 15),
  list(nombre = "Leche", precio = 60, cantidad = 10),
  list(nombre = "Pan", precio = 40, cantidad = 25),
  list(nombre = "Queso", precio = 100, cantidad = 5)
)

# Búsqueda binaria
busqueda_binaria <- function(lista, clave) {
  if (length(lista) == 0) {
    stop("La lista está vacía.")
  }
  
  izquierda <- 1
  derecha <- length(lista)
  
  while (izquierda <= derecha) {
    medio <- floor((izquierda + derecha) / 2)
    if (lista[[medio]]$nombre == clave) {
      return(lista[[medio]])
    } else if (lista[[medio]]$nombre < clave) {
      izquierda <- medio + 1
    } else {
      derecha <- medio - 1
    }
  }
  stop(paste("Producto no encontrado:", clave))
}

# Pruebas
clave <- "Leche"

resultado <- tryCatch({
  busqueda_binaria(productos, clave)
}, error = function(e) {
  cat("Error:", e$message, "\n")
  NULL
})

if (!is.null(resultado)) {
  cat("Producto encontrado:", resultado$nombre, ", Precio:", resultado$precio, ", Cantidad:", resultado$cantidad, "\n")
}
