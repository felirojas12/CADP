{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de
cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos
consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos
de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando
el módulo desarrollado en el inciso a y retorne la cantidad total de minutos y la cantidad total de MB a
facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta
$1,35.}


program ej4;
type
	lineas = record
		telefono: integer;
		minutos: real;
		mb: real;
	end;
	cliente = record
		codigo: integer;
		cantlineas: integer;
		lineas: lineas;
	end;
procedure leerlinea (var l:lineas);
	begin
		writeln('Ingrese el numero de telefono de la linea:');
		readln(l.telefono);
		writeln('Ingrese la cantidad de minutos consumidos:');
		readln(l.minutos);
		writeln('Ingrese la cantidad de MBs consumidos:');
		readln(l.mb);
	end;
procedure leer (var c:cliente;var mbtotales: real; var mtotales: real);
	var
		i: integer;
	begin
		writeln('Ingrese el codigo del cliente:');
		readln(c.codigo);
		writeln('Ingrese la cantidad de lineas que posee el cliente ',c.codigo,':');
		readln(c.cantlineas);
		writeln('Ingrese los datos de las ',c.cantlineas,':');
		for i:= 1 to c.cantlineas do begin
			leerlinea(c.lineas);
			mbtotales+=c.lineas.mb;
			mtotales+=c.lineas.minutos;
		end;
	end;
function calcularmb (mb:real):real;
	begin
		calcularmb:=mb*1.35;
	end;
function calcularm (m:real):real;
	begin
		calcularm:=m*3.40;
	end;
var
	i: integer;
	c: cliente;
	mbtotales, minutostotales: real;
BEGIN
	for i:=1 to 5 do begin
		mbtotales:=0;
		minutostotales:=0;
		leer(c,mbtotales,minutostotales);
		writeln('El cliente debe abonar el monto de ',minutostotales:0:2,' minutos y ',mbtotales:0:2,' MBs.');
		writeln('EN TOTAL: $',(calcularmb(mbtotales)+calcularm(minutostotales)):0:2,'.');
	end;	
END.

