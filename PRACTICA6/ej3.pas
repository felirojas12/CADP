{Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados, manteniendo un puntero al último ingresado.}

program JugamosConListas;
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
	
procedure imprimir(l: lista);
	begin
		writeln('La lista se compone de los siguientes numeros: ');
		while (l <> nil) do begin
			writeln(l^.num);
			l:=l^.sig;
		end;
	end;

var
	pri, ult: lista;
	valor : integer;
begin
	pri := nil;
	writeln('Ingrese un numero: ');
	read(valor);
	while (valor <> 0) do begin
		agregarAtras(pri,ult,valor);
		writeln('Ingrese un numero: ');
		read(valor);
	end;
	imprimir(pri);
end.
