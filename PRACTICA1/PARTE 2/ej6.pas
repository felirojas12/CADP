{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto se lee
código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.}
program punto6;
var
	i,codigo,precio,cod1,cod2,min1,min2,dypar:integer;
	esdieciseis,espar:boolean;
begin
	dypar:=0;
	min1:=201;
	min2:=201;
	for i:=1 to 5 do begin
		writeln('Escriba el codigo del producto:');
		readln(codigo);
		writeln('Escriba el precio del producto:');
		readln(precio);
		if (precio<min1) then begin
			min2:=min1;
			min1:=precio;
			cod1:=codigo;
		end;
		if ((precio>min1) and (precio<min2)) then begin
			min2:=precio;
			cod2:=codigo;
		end;
		espar:=(codigo mod 2 = 0);
		esdieciseis:=(precio>16);
		if (esdieciseis and espar) then
			dypar+=1;
	end;
	writeln('Los codigos de los dos productos mas baratos fueron: ',cod1,' y ',cod2);
	writeln('La cantidad de productos con precio mayor a 16 pesos y con codigo par fueron: ',dypar);
end.
