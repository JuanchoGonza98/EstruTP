program BusquedaBinaria;

uses SysUtils;

type
  Producto = record
    Nombre: string;
    Precio: real;
    Cantidad: integer;
  end;

var
  productos: array[1..5] of Producto;

function BusquedaBinaria(var lista: array of Producto; clave: string): integer;
var
  izquierda, derecha, medio: integer;
begin
  if Length(lista) = 0 then
    raise Exception.Create('La lista está vacía.');

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

  raise Exception.Create('Producto no encontrado: ' + clave);
end;

var
  i: integer;
  clave: string;
begin
  try
    productos[1].Nombre := 'Arroz'; productos[1].Precio := 50; productos[1].Cantidad := 20;
    productos[2].Nombre := 'Harina'; productos[2].Precio := 30; productos[2].Cantidad := 15;
    productos[3].Nombre := 'Leche'; productos[3].Precio := 60; productos[3].Cantidad := 10;
    productos[4].Nombre := 'Pan'; productos[4].Precio := 40; productos[4].Cantidad := 25;
    productos[5].Nombre := 'Queso'; productos[5].Precio := 100; productos[5].Cantidad := 5;

    clave := 'Leche';
    i := BusquedaBinaria(productos, clave);

    writeln('Producto encontrado: ', productos[i].Nombre, ', Precio: ', productos[i].Precio:0:2, ', Cantidad: ', productos[i].Cantidad);
  except
    on E: Exception do
      writeln('Error: ', E.Message);
  end;
end.
