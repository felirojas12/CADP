{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se
lee: marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}
program untitled;
type
	auto = record
		marca: string;
		modelo: integer;
		precio: real;
	end;
procedure leerAuto (var a: auto);
	begin
		writeln('Ingrese la marca del auto:');
		readln(a.marca);
		writeln('Ingrese el modelo del auto:');
		readln(a.modelo);
		writeln('Ingrese el precio del auto:');
		readln(a.precio);
	end;
function promedio (precio:real;cantidad:integer): real;
	begin
		promedio:=precio/cantidad;
	end;
procedure maximo (a: auto; var max: real; var marcacara: string; var modelocaro: integer);
	begin
		if (a.precio>max) then begin
			max:=a.precio;
			marcacara:=a.marca;
			modelocaro:=a.modelo;
		end;
	end;
var
	a: auto;
	cant,modelocaro: integer;
	preciototal,max: real;
	actual,marcacara: string;
BEGIN
	max:=-1;
	leerAuto(a);
	while (a.marca <> 'ZZZ') do begin
		actual:=a.marca;
		cant:=0;
		preciototal:=0;
		while ((a.marca <> 'ZZZ') and (actual = a.marca)) do begin
			cant+=1;
			preciototal+=a.precio;
			maximo(a,max,marcacara,modelocaro);
			leerAuto(a);
		end;
		writeln('El precio promedio de la marca ',actual,' es de $',promedio(preciototal,cant):0:2,'.');
	end;
	writeln('El auto mas caro fue de marca ',marcacara,' y modelo ',modelocaro);
END.

