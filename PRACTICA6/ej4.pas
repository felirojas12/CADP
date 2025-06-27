{Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de
elementos de la lista que son múltiplos de A.}

program ej4;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure armarNodo(var L: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := L;
		L := aux;
	end;

procedure imprimir(l: lista);
	begin
		writeln('La lista se compone de los siguientes numeros: ');
		while (l <> nil) do begin
			writeln(l^.num);
			l:=l^.sig;
		end;
	end;
	
function maximo(l: lista): integer;
	var
		max: integer;
	begin
		max:=-9999;
		while (l <> nil) do begin
			if (l^.num > max) then
				max:=l^.num;
			l:=l^.sig;
		end;
		maximo:=max;
	end;

function minimo (l: lista): integer;
	var
		min: integer;
	begin
		min:=9999;
		while (l <> nil) do begin
			if (l^.num < min) then
				min:=l^.num;
			l:=l^.sig;
		end;
		minimo:=min;
	end;
	
function multiplos (l: lista; a: integer): integer;
	var
		aux: integer;
	begin
		aux:= 0;
		while (l<>nil) do begin
			if (l^.num mod a = 0) then
				aux:=aux+1;
			l:=l^.sig;
		end;
		multiplos:=aux;
	end;

var
	pri : lista;
	valor,a : integer;
begin
	pri := nil;
	writeln('Ingrese un numero: ');
	read(valor);
		while (valor <> 0) do begin
			armarNodo(pri, valor);
			writeln('Ingrese un numero: ');
			read(valor);
		end;
	imprimir(pri);
	write('Ingrese un numero del que quiera hallar la cantidad de multiplos: ');
	readln(a);
	writeln('Hay ',multiplos(pri,a),' multiplos de ',a,'.');
	writeln('El numero mas grande de la lista fue: ',maximo(pri),'.');
	writeln('El numero mas chico de la lista fue: ',minimo(pri),'.');
end.
