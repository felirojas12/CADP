{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.}


program ej10;

type
	datos = record
		dni: integer;
		num: integer;
	end;
	
	lista = ^nodo;
	nodo = record
		dat: datos;
		sig: lista;
	end;
	
procedure agregarAtras (var l: lista; var ult: lista; d: datos);
	var
		nue: lista;
	begin
		new(nue);
		nue^.dat:= d;
		nue^.sig:= nil;
		if (l = nil) then
			l:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
	end;
	
procedure recibirCliente (var l: lista; var ult: lista; dni: integer; var cont: integer);
	var
		aux: datos;
	begin
		cont:= cont+1;
		aux.dni:= dni;
		aux.num:= cont;
		agregarAtras(l,ult,aux);
	end;

procedure atenderCliente (var l: lista; var datosC: datos);
	var
		sig: lista;
	begin
		datosC:= l^.dat;
		sig:= l^.sig;
		dispose (l);
		l:= sig;
	end;

var
	l,ult: lista;
	datosC: datos;
	dni,cont: integer;
BEGIN
	l:= nil;
	ult:= nil;
	cont:= 0;
	write('Escriba el DNI del cliente que ingreso: ');
	readln(dni);
	while (dni <> 0) do begin
		recibirCliente(l,ult,dni,cont);
		write('Escriba el DNI del cliente que ingreso: ');
		readln(dni);
	end;
	while (l <> nil) do begin
		atenderCliente(l,datosC);
		writeln('Cliente a atender: ',datosC.dni);
	end;
END.

