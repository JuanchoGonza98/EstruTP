# Multiplicación manual de matrices
def multiplicar_matrices(a, b)
    filas_a = a.length
    columnas_a = a[0].length
    filas_b = b.length
    columnas_b = b[0].length
  
    # Verificar compatibilidad de dimensiones
    raise "Las dimensiones de las matrices no son compatibles para la multiplicación." if columnas_a != filas_b
  
    # Crear matriz resultado
    resultado = Array.new(filas_a) { Array.new(columnas_b, 0) }
  
    # Multiplicación manual
    filas_a.times do |i|
      columnas_b.times do |j|
        columnas_a.times do |k|
          resultado[i][j] += a[i][k] * b[k][j]
        end
      end
    end
  
    resultado
  end
  
  # Prueba
  a = [
    [1, 2, 3],
    [4, 5, 6]
  ]
  
  b = [
    [7, 8],
    [9, 10],
    [11, 12]
  ]
  
  begin
    resultado = multiplicar_matrices(a, b)
    resultado.each { |fila| puts fila.inspect }
  rescue => e
    puts "Error: #{e.message}"
  end
  require 'matrix'
a = Matrix[[1, 2, 3], [4, 5, 6]]
b = Matrix[[7, 8], [9, 10], [11, 12]]
resultado = a * b
puts resultado
