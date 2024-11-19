# Definición de la estructura
class Producto
    attr_accessor :nombre, :precio, :cantidad
  
    def initialize(nombre, precio, cantidad)
      @nombre = nombre
      @precio = precio
      @cantidad = cantidad
    end
  end
  
  # Lista de registros (ordenada por nombre)
  productos = [
    Producto.new("Arroz", 50, 20),
    Producto.new("Harina", 30, 15),
    Producto.new("Leche", 60, 10),
    Producto.new("Pan", 40, 25),
    Producto.new("Queso", 100, 5)
  ]
  
  # Búsqueda binaria
  def busqueda_binaria(lista, clave)
    raise "La lista está vacía." if lista.empty?
  
    izquierda = 0
    derecha = lista.length - 1
  
    while izquierda <= derecha
      medio = (izquierda + derecha) / 2
      if lista[medio].nombre == clave
        return lista[medio]
      elsif lista[medio].nombre < clave
        izquierda = medio + 1
      else
        derecha = medio - 1
      end
    end
  
    raise "Producto '#{clave}' no encontrado."
  end
  
  # Pruebas
  clave = "Leche"
  
  begin
    resultado = busqueda_binaria(productos, clave)
    puts "Producto encontrado: #{resultado.nombre}, Precio: #{resultado.precio}, Cantidad: #{resultado.cantidad}"
  rescue => e
    puts "Error: #{e.message}"
  end
  
  