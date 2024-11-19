program MergeSortRegistros;

type
  Estudiante = record
    Nombre: string;
    Edad: integer;
    Calificacion: integer;
  end;

var
  estudiantes: array of Estudiante;

// Declarar el procedimiento Merge como forward
procedure Merge(var lista: array of Estudiante; izquierda, medio, derecha: integer); forward;

procedure MergeSort(var lista: array of Estudiante; izquierda, derecha: integer);
var
  medio: integer;
begin
  if izquierda < derecha then
  begin
    medio := (izquierda + derecha) div 2;

    MergeSort(lista, izquierda, medio);
    MergeSort(lista, medio + 1, derecha);
    Merge(lista, izquierda, medio, derecha);
  end;
end;

procedure Merge(var lista: array of Estudiante; izquierda, medio, derecha: integer);
var
  i, j, k, n1, n2: integer;
  izquierdaTemp, derechaTemp: array of Estudiante;
begin
  n1 := medio - izquierda + 1;
  n2 := derecha - medio;

  SetLength(izquierdaTemp, n1);
  SetLength(derechaTemp, n2);

  for i := 0 to n1 - 1 do
    izquierdaTemp[i] := lista[izquierda + i];
  for j := 0 to n2 - 1 do
    derechaTemp[j] := lista[medio + 1 + j];

  i := 0; j := 0; k := izquierda;

  while (i < n1) and (j < n2) do
  begin
    if izquierdaTemp[i].Edad <= derechaTemp[j].Edad then // Ordenar por edad
    begin
      lista[k] := izquierdaTemp[i];
      i := i + 1;
    end
    else
    begin
      lista[k] := derechaTemp[j];
      j := j + 1;
    end;
    k := k + 1;
  end;

  while i < n1 do
  begin
    lista[k] := izquierdaTemp[i];
    i := i + 1;
    k := k + 1;
  end;

  while j < n2 do
  begin
    lista[k] := derechaTemp[j];
    j := j + 1;
    k := k + 1;
  end;
end;

var
  i: integer;
begin
  SetLength(estudiantes, 4);
  estudiantes[0].Nombre := 'Alice'; estudiantes[0].Edad := 20; estudiantes[0].Calificacion := 85;
  estudiantes[1].Nombre := 'Bob'; estudiantes[1].Edad := 19; estudiantes[1].Calificacion := 90;
  estudiantes[2].Nombre := 'Charlie'; estudiantes[2].Edad := 22; estudiantes[2].Calificacion := 78;
  estudiantes[3].Nombre := 'Diana'; estudiantes[3].Edad := 21; estudiantes[3].Calificacion := 88;

  MergeSort(estudiantes, 0, High(estudiantes));

  for i := 0 to High(estudiantes) do
    writeln(estudiantes[i].Nombre, ', Edad: ', estudiantes[i].Edad, ', Calificación: ', estudiantes[i].Calificacion);
end.
