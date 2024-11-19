program BusquedaBinaria;

type
  Producto = record
    Nombre: string;
    Precio: real;
    Cantidad: integer;
  end;

var
  productos: array[1..5] of Producto;
  i: integer;

function BusquedaBinaria(var lista: array of Producto; clave: string): integer;
var
  izquierda, derecha, medio: integer;
begin
  izquierda := 0;
  derecha := High(lista);
  
  while izquierda <= derecha do
  begin
    medio := (izquierda + derecha) div 2;
    if lista[medio].Nombre = clave then
    begin
      BusquedaBinaria := medio;
      Exit;
    end
    else if lista[medio].Nombre < clave then
      izquierda := medio + 1
    else
      derecha := medio - 1;
  end;
  BusquedaBinaria := -1;
end;

begin
  productos[1].Nombre := 'Arroz'; productos[1].Precio := 50; productos[1].Cantidad := 20;
  productos[2].Nombre := 'Harina'; productos[2].Precio := 30; productos[2].Cantidad := 15;
  productos[3].Nombre := 'Leche'; productos[3].Precio := 60; productos[3].Cantidad := 10;
  productos[4].Nombre := 'Pan'; productos[4].Precio := 40; productos[4].Cantidad := 25;
  productos[5].Nombre := 'Queso'; productos[5].Precio := 100; productos[5].Cantidad := 5;

  // Prueba
  i := BusquedaBinaria(productos, 'Leche');
  if i <> -1 then
    writeln('Producto encontrado: ', productos[i].Nombre, ', Precio: ', productos[i].Precio:0:2, ', Cantidad:
