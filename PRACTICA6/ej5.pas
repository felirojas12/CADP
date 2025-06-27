{Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo. COMPLETO
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares. COMPLETO
c. Código de los dos productos más económicos.}

program ej5;
type
	producto = record
		codigo: integer;
		descripcion: string;
		stock: integer;
		stockmin: integer;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		p: producto;
		sig: lista;
	end;
	
procedure leerRegistro (var p: producto);
	begin
		writeln('==== PRODUCTO ====');
		write('Ingrese el codigo del producto: ');
		readln(p.codigo);
		if (p.codigo <> -1) then begin
			write('Ingrese la descripcion del producto: ');
			readln(p.descripcion);
			write('Ingrese el stock del producto: ');
			readln(p.stock);
			write('Ingrese el stock minimo del producto: ');
			readln(p.stockmin);
			write('Ingrese el precio del producto: ');
			readln(p.precio);
		end;
	end;

procedure cargarNodo (var l: lista; p: producto);
	var
		nuevo: lista;
	begin
		new(nuevo);
		nuevo^.p:=p;
		nuevo^.sig:=l;
		l:=nuevo;
	end;
	
procedure cargarLista (var l: lista; var total: integer);
	var
		p: producto;
	begin
		leerRegistro(p);
		while (p.codigo <> -1) do begin
			total:=total+1;
			cargarNodo(l,p);
			leerRegistro(p);
		end;
	end;

function esMenor (stock: integer; stockmin: integer): boolean;
	begin
		esMenor:=stock<stockmin;
	end;
	
function porcentaje (l: lista; total: integer): real;
	var
		menores: integer;
	begin
		menores:= 0;
		while (l <> nil) do begin
			if esMenor(l^.p.stock,l^.p.stockmin) then
				menores+=1;
			l:=l^.sig;
		end;
		porcentaje:=((menores/total)*100);
	end;

function digitosPares (c: integer): integer;
	var
		aux, resto: integer;
	begin
		aux:=0;
		while (c <> 0) do begin
			resto:=c mod 10;
			if (resto mod 2 = 0) then
				aux+=1;
			c:=c div 10;
		end;
		digitosPares:=aux;
	end;

procedure descripcion (l: lista);
	begin
		while (l <> nil) do begin
			if (digitosPares(l^.p.codigo) >= 3) then begin
				writeln('El producto con descripcion "',l^.p.descripcion,'" tiene un codigo con 3 o mas digitos pares.');
			end;
			l:=l^.sig;
		end;
	end;
	
procedure minimos (l: lista; var c1: integer; var c2: integer);
	var
		min1,min2: real;
	begin
		min1:=9999;
		min2:=9999;
		while (l <> nil) do begin
			if (l^.p.precio < min1) then begin
				min2:=min1;
				c2:=c1;
				min1:=l^.p.precio;
				c1:=l^.p.codigo;
			end;
			if ((l^.p.precio > min1) and (l^.p.precio < min2)) then begin
				min2:=l^.p.precio;
				c2:=l^.p.codigo;
			end;
			l:=l^.sig;
		end;
	end;
var
	l: lista;
	total,c1,c2: integer;
BEGIN
	l:=nil;
	total:= 0;
	cargarLista(l,total);
	writeln('Alrededor de un ',porcentaje(l,total):0:1,'% de los productos poseian stock menor al minimo.');
	descripcion(l);
	minimos(l,c1,c2);
	writeln('Codigo del producto mas barato: ',c1,'.');
	writeln('Codigo del segundo producto mas barato: ',c2,'.');
END.

