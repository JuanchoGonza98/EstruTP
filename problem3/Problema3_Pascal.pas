program MultiplicacionMatrices;

type
  Matriz = array of array of integer;

function MultiplicarMatrices(A, B: Matriz): Matriz;
var
  filasA, columnasA, filasB, columnasB: integer;
  i, j, k: integer;
  Resultado: Matriz; // Variable explícita para la matriz resultado
begin
  filasA := Length(A);
  columnasA := Length(A[0]);
  filasB := Length(B);
  columnasB := Length(B[0]);

  // Verificar compatibilidad de dimensiones
  if columnasA <> filasB then
  begin
    writeln('Error: Las dimensiones de las matrices no son compatibles para la multiplicación.');
    halt(1); // Finalizar ejecución
  end;

  // Crear la matriz resultado
  SetLength(Resultado, filasA, columnasB);

  // Multiplicación manual
  for i := 0 to filasA - 1 do
    for j := 0 to columnasB - 1 do
    begin
      Resultado[i][j] := 0;
      for k := 0 to columnasA - 1 do
      begin
        Resultado[i][j] := Resultado[i][j] + A[i][k] * B[k][j];
      end;
    end;

  MultiplicarMatrices := Resultado; // Retornar la matriz resultado
end;

var
  A, B, Resultado: Matriz;
  i, j: integer;
begin
  // Definir matrices
  SetLength(A, 2, 3);
  A[0, 0] := 1; A[0, 1] := 2; A[0, 2] := 3;
  A[1, 0] := 4; A[1, 1] := 5; A[1, 2] := 6;

  SetLength(B, 3, 2);
  B[0, 0] := 7; B[0, 1] := 8;
  B[1, 0] := 9; B[1, 1] := 10;
  B[2, 0] := 11; B[2, 1] := 12;

  // Multiplicar matrices
  Resultado := MultiplicarMatrices(A, B);

  // Mostrar resultados
  writeln('Resultado:');
  for i := 0 to High(Resultado) do
  begin
    for j := 0 to High(Resultado[i]) do
      write(Resultado[i][j]:4);
    writeln;
  end;
end.
