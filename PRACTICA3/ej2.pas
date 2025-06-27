{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el
año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese
año.
a. Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada
casamiento.
b. Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el
definido en el inciso a.
c. Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura
finaliza al ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos
realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos
realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b) para la lectura
de fecha.}
program ej2;
type
	fecha = record
		dia: integer;
		mes: integer;
		ano: integer;
	end;
	casamientos = record
		miembro1: string;
		miembro2: string;
		f: fecha;
	end;
procedure leerFecha (var f: fecha);
	begin
		writeln('Escriba el dia:');
		readln(f.dia);
		writeln('Escriba el mes:');
		readln(f.mes);
		writeln('Escriba el ano:');
		readln(f.ano);
	end;
procedure leer (var c: casamientos);
	begin
		writeln('Escriba la fecha del casamiento (terminar con Ano = 2020):');
		leerFecha(c.f);
		writeln('Escriba el nombre y apellido de un miembro de la pareja:');
		readln(c.miembro1);
		writeln('Escriba el nombre y apellido del otro miembro de la pareja:');
		readln(c.miembro2);
	end;
function esVerano (mes:integer):boolean;
	begin
		esVerano:=((mes=1) or (mes=2) or (mes=3));
	end;
function condicion(dia:integer):boolean;
	begin
		condicion:=((dia>0) and (dia<=10));
	end;
var
	casamientosverano,diez:integer;
	casam: casamientos;
BEGIN
	casamientosverano:=0;
	diez:=0;
	leer (casam);
	while (casam.f.ano<>2020) do begin
		if esVerano(casam.f.mes) then
			casamientosverano+=1;
		if condicion(casam.f.dia) then
			diez+=1;
		leer(casam);
	end;
	writeln('La cantidad de casamientos realizados durante los meses de verano fue de: ',casamientosverano);
	writeln('La cantidad de casamientos realizados en los primeros 10 días de cada mes fue de: ',diez);
END.

