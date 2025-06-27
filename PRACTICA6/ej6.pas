{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento). COMPLETADO
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético. COMPLETADO
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas. COMPLETADO
Nota: para resolver los incisos a), b), y c) la lista debe recorrerse la menor cantidad de veces posible}

program ej6;
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
	
procedure cargarNodo(var l: lista; s: sonda);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.son:=s;
		nuevo^.sig:=l;
		l:=nuevo;
	end;
	
procedure inicializar (var vc: vectorContador);
	var
		i: espectro;
	begin
		for i:= 1 to df do
			vc[i]:= 0;
	end;

procedure contar (var vc: vectorContador; rango: espectro);
	begin
		vc[rango]:=vc[rango]+1;
	end;

procedure imprimirContador (vc: vectorContador);
	var
		i: espectro;
	begin
		for i:= 1 to df do begin
			if (vc[i] <> 0) then
				writeln('Hubo ',vc[i],' sonda/s que realizaron estudios en el rango ',i,'.');
		end;
	end;
	
procedure maximo (costo: real; nombre: string; var nombreMax: string; var max: real);
	begin
		if (costo > max) then begin
			max:= costo;
			nombreMax:= nombre;
		end;
	end;

procedure cargarLista (var l: lista; var nombreMax: string; var 
contador: vectorContador; var duracionEstTotal: integer; 
var total: integer);
	var
		max, costoTotal: real;
		s: sonda;
	begin
		total:= 0;
		duracionEstTotal:= 0;
		max:= -9999;
		l:=nil;
		inicializar(contador);
		repeat
			leerSonda(s);
			cargarNodo(l,s);
			costoTotal:=s.costo+s.mantenimiento;
			maximo(costoTotal,s.nombre,nombreMax,max);
			duracionEstTotal:=duracionEstTotal+s.meses;
			contar(contador,s.rango);
			total:=total+1;
		until (s.nombre = 'GAIA');
	end;

function promedio (duracion: integer; total: integer): real;
	begin
		promedio:=duracion/total;
	end;

function calcularDuracion (l: lista; duracionEstTotal: integer; total: integer): integer;
	var
		aux: integer;
	begin
		aux:= 0;
		while (l <> nil) do begin
			if (l^.son.meses > promedio(duracionEstTotal,total)) then
				aux:= aux+1;
			l:=l^.sig;
		end;
		calcularDuracion:=aux;
	end;

var
	total, duracionEstTotal: integer;
	contador: vectorContador;
	nombreMax: string;
	l: lista;
BEGIN
	cargarLista (l,nombreMax,contador,duracionEstTotal,total);
	writeln('');
	writeln(nombreMax,' fue la sonda mas cara. ');
	writeln('');
	imprimirContador(contador);
	writeln('');
	writeln('Hay ',calcularDuracion(l,duracionEstTotal,total),' sonda/s que tardaron mas tiempo en realizar su mision que el promedio.');
END.

