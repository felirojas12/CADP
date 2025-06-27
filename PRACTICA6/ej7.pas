{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
anterior, se han determinado los siguientes criterios:
- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
desde la superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
H2020. Para ello, utilice el módulo realizado en b.}

program ej7;
const
	df = 7;
type
	espectro = 1..df;
	sonda = record
		nombre: string;
		meses: integer;
		costo: real;
		mantenimiento: real;
		rango: espectro;
	end;
	
	lista = ^nodo;
	nodo= record
		son: sonda;
		sig: lista;
	end;
	
	vectorContador = array [espectro] of integer;

procedure leerSonda (var s: sonda);
	begin
		writeln('==== SONDA ====');
		write('Ingrese el nombre de la sonda: ');
		readln(s.nombre);
		write('Ingrese la cantidad estimada de meses que durara la mision de la sonda ',s.nombre,': ');
		readln(s.meses);
		write('Ingrese el costo de produccion que tuvo: ');
		readln(s.costo);
		write('Ingrese el costo de mantenimiento mensual: ');
		readln(s.mantenimiento);
		write('Ingrese el rango del espectro electromagnetico sobre el que realizara estudios: ');
		readln(s.rango);
	end;
	
procedure imprimirSonda (s: sonda; var cont: integer);
	begin
		cont:=cont + 1;
		writeln('==== SONDA ',cont,' ====');
		writeln('Nombre de la sonda: ',s.nombre,'.');
		writeln('Duracion estimada de la mision: ',s.meses,' meses.');
		writeln('Costo de produccion: ',s.costo:0:2,'.');
		writeln('Costo de mantenimiento: ',s.mantenimiento:0:2,'.');
		writeln('Rango del espectro electromagnetico sobre el que realizara estudios: ',s.rango,'.');
	end;
	
procedure cargarNodo(var l: lista; s: sonda);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.son:=s;
		nuevo^.sig:=l;
		l:=nuevo;
	end;
	
procedure cargarLista (var l: lista);
	var
		s: sonda;
	begin
		l:=nil;
		repeat
			leerSonda(s);
			cargarNodo(l,s);
		until (s.nombre = 'GAIA');
	end;
	
function cumple (s: sonda): boolean;
	var
		aux: boolean;
	begin
		if ((s.costo >= s.mantenimiento) and (s.rango <> 1)) then
			aux:= true
		else
			aux:= false;
		cumple:= aux;
	end;

procedure recorrerLista (l: lista; var l1: lista; var l2: lista);
	begin
		while (l <> nil) do begin
			if cumple(l^.son) then
				cargarNodo(l1,l^.son)
			else
				cargarNodo(l2,l^.son);
			l:=l^.sig;
		end;
	end;
	
procedure informarLista (l: lista);
	var
		cont: integer;
	begin
		cont:= 0;
		while (l <> nil) do begin
			imprimirSonda(l^.son,cont);
			l:=l^.sig;
		end;
	end;
	
var
	l,l1,l2: lista;
BEGIN
	l1:= nil;
	l2:= nil;
	cargarLista(l);
	writeln('');
	informarLista(l);
	writeln('');
	recorrerLista(l,l1,l2);
	informarLista(l1);
	writeln('');
	informarLista(l2);
END.

