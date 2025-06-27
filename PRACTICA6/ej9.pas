{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente.}

program ej9;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
	
procedure agregarAtras(var L: lista;var ult: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if (L = nil) then
			L:=aux
		else
			ult^.sig:= aux;
		ult:=aux;
	end;
	
procedure informarLista (l: lista);
	var
		cont: integer;
	begin
		cont:= 0;
		while (l <> nil) do begin
			cont:= cont+1;
			writeln('El numero en la posicion ',cont,' es: ',l^.num,'.');
			l:=l^.sig;
		end;
	end;

//a
function estaOrdenada(l: lista): boolean;
	var
		aux: boolean;
		act, ant: lista;
	begin
		aux:= true;
		ant:= l;
		act:= ant^.sig;
		while ((act <> nil) and (aux = true)) do begin
			if (act^.num > ant^.num) then
				aux:= true
			else
				aux:= false;
			ant:= act;
			act:= act^.sig;
		end;
		estaOrdenada:= aux;
	end;
	
//b
procedure eliminar(var l: lista; v: integer);
	var
		act, ant: lista;
	begin
		act:=l;	
		while (act <> nil) do begin
			if (act^.num <> v) then begin
				ant:= act;
				act:= act^.sig;
			end
			else begin
				if (act = l) then begin
					l:= l^.sig;
					dispose (act);
					act:= l;
				end
				else begin
					ant^.sig:= act^.sig;
					dispose (act);
					act:= ant;
				end;
			end;
		end;
	end;

//c
procedure sublista(l: lista; var lista2: lista; a: integer; b: integer);
	var
		ult2: lista;
	begin
		while (l <> nil) do begin
			if ((l^.num > a) and (l^.num < b)) then
				agregarAtras(lista2,ult2,l^.num);
			l:=l^.sig;
		end;
	end;

var
	pri, ult, lista2: lista;
	valor : integer;
begin
	pri := nil;
	write('Ingrese un numero: ');
	readln(valor);
	while (valor <> 0) do begin
		agregarAtras(pri,ult, valor);
		write('Ingrese un numero: ');
		readln(valor);
	end;
	writeln('');
	informarLista(pri);
	writeln('');
	if estaOrdenada(pri) then
		writeln('La lista esta ordenada.')
	else
		writeln('La lista no esta ordenada');
	writeln('');
	write('Ingrese el numero que desee eliminar de la lista: ');
	readln(valor);
	eliminar(pri,valor);
	writeln('');
	informarLista(pri);
	sublista(pri,lista2,6,32);
	writeln('');
	writeln('Lista formada con los numeros entre el 6 y el 32: ');
	informarLista(lista2);
end.
