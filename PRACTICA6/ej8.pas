{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la
lista queden ordenados de manera ascendente (insertar ordenado).}

program ej8;
type
	lista = ^nodo;
		nodo = record
		num : integer;
		sig : lista;
	end;
	
procedure armarNodo(var l: lista; v: integer);
	var
		aux, act, ant: lista;
	begin
		new(aux);
		aux^.num := v;
		act:= l;
		ant:= l;
		while ((act <> nil) and (v > act^.num)) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = ant) then
			l:= aux
		else
			ant^.sig:= aux;
		aux^.sig:= act;
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
	
	
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	write('Ingrese un numero: ');
	readln(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		write('Ingrese un numero: ');
		readln(valor);
	end;
	informarLista(pri)
end.
