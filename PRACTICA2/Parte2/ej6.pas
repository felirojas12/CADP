{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.
* Escribir 100 productos: 
	Repetir 100
	Leer codigo
	Leer precio
	* Dos productos mas baratos
	* Precio promedio
		CantidadTotal y PrecioTotal=Promedio.
	Leer tipo
	* Tipo pantalon mas caro}
program ej6;
procedure dosmasbaratos(cod:integer;precio:real; var barato1,barato2:integer; var m1,m2:real);
	begin
		if (precio<m1) then begin
			m2:=m1;
			m1:=precio;
			barato1:=cod;
		end;
		if ((precio>m1) and (precio<m2)) then begin
			m2:=precio;
			barato2:=cod;
		end;
	end;
function promedio(cantidadTotal,precioTotal:real):real;
	begin
		promedio:=(precioTotal/cantidadTotal);
	end;
function masCaro(p1:real;codigodelpantalon:integer):integer;
	var
		max:real;
	begin
		max:=-1;
		if (p1<max) then
			max:=p1;
		masCaro:=codigodelpantalon;
	end;
var
	i,codigo,cod1,cod2,pantalonmascaro:integer;
	min1,min2,price,cantTotal,pTotal:real;
	tipo:string;
BEGIN
	min1:=9999;
	min2:=9999;
	cod1:=0;
	cod2:=0;
	cantTotal:=0;
	pTotal:=0;
	for i:=1 to 3 do begin
		writeln('Escriba el codigo del producto:');
		readln(codigo);
		writeln('Escriba el precio del producto con codigo ',codigo,': ');
		readln(price);
		writeln('Escriba el tipo de producto:');
		readln(tipo);
		cantTotal+=1;
		pTotal+=price;
		dosmasbaratos(codigo,price,cod1,cod2,min1,min2);
		if (tipo='pantalon') then
			pantalonmascaro:=masCaro(price,codigo);
	end;
	writeln('El producto mas barato fue el del codigo ',cod1,', y el segundo mas barato fue el del codigo ',cod2,'.');
	writeln('El pantalon mas caro el del codigo ',pantalonmascaro,'.');
	writeln('El precio promedio de los productos fue de ',promedio(cantTotal,pTotal):4:2,'.');
END.

