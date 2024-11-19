# Definición de la estructura
class Estudiante
  attr_accessor :nombre, :edad, :calificacion

  def initialize(nombre, edad, calificacion)
    @nombre = nombre
    @edad = edad
    @calificacion = calificacion
  end
end

# Lista de registros
estudiantes = [
  Estudiante.new("Alice", 20, 85),
  Estudiante.new("Bob", 19, 90),
  Estudiante.new("Charlie", 22, 78),
  Estudiante.new("Diana", 21, 88)
]

# Implementación de MergeSort
def merge_sort(lista)
  return lista if lista.length <= 1

  mid = lista.length / 2
  izquierda = merge_sort(lista[0...mid])
  derecha = merge_sort(lista[mid..])

  merge(izquierda, derecha)
end

def merge(izquierda, derecha)
  resultado = []
  until izquierda.empty? || derecha.empty?
    if izquierda.first.edad <= derecha.first.edad  # Ordenar por edad
      resultado << izquierda.shift
    else
      resultado << derecha.shift
    end
  end
  resultado + izquierda + derecha
end

# Llamada al algoritmo
estudiantes = merge_sort(estudiantes)

# Mostrar resultados
estudiantes.each do |estudiante|
  puts "#{estudiante.nombre}, Edad: #{estudiante.edad}, Calificación: #{estudiante.calificacion}"
end
