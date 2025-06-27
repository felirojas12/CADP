{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y
el promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio
del egresado (de mayor a menor).}


program ej11;
const
	df = 2;
type
	egresado = record
		num: integer;
		apellido: string;
		promedio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		eg: egresado;
		sig: lista;
	end;
	
	prom = array [1..df] of egresado;
	
procedure leerEgresado (var eg: egresado);
	begin
		writeln('==== INGRESE AL EGRESADO (ORDENADO DE MENOR A MAYOR PROMEDIO) ====');
		write('Ingrese el numero del alumno: ');
		readln(eg.num);
		write('Ingrese el apellido del alumno: ');
		readln(eg.apellido);
		write('Ingrese el promedio del alumno: ');
		readln(eg.promedio);
	end;
	
procedure informarEgresado (eg: egresado);
	begin
		writeln('Numero de alumno del egresado: ',eg.num);
		writeln('Apellido del egresado: ',eg.apellido);
		writeln('Promedio del egresado: ',eg.promedio:0:1);
	end;

procedure cargarNodo(var l: lista; eg: egresado);
	var
		nue: lista;
	begin
		new(nue);
		nue^.eg:= eg;
		nue^.sig:= l;
		l:= nue;
	end;
	
procedure cargarLista (var l: lista);
	var
		eg: egresado;
	begin
		l:= nil;
		leerEgresado(eg);
		while (eg.num <> 0) do begin
			cargarNodo(l,eg);
			leerEgresado(eg);
		end;
	end;

procedure imprimirPromedios(l: lista; var promedio: prom);
	var
		i: integer;
	begin
		for i:= 1 to df do begin
			if (l <> nil) then begin
				promedio[i]:=l^.eg;
				informarEgresado(l^.eg);
			end;
			l:= l^.sig;
		end;
	end;	
var
	l: lista;
	promedio: prom;
BEGIN
	l:= nil;
	cargarLista(l);
	imprimirPromedios(l,promedio);
END.

