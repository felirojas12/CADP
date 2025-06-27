{Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al
finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e
informe la operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la
posición ... fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}
program ej5;
const
	dimF = 100;
type
	datos = array[1..dimF] of integer; 
procedure cargarVector(var v:datos; var dimL: integer);
	var
		num:integer;
	begin
		dimL:=0;
		write('Ingrese el numero para ingresar en la posicion ',dimL+1,' (hasta la posicion ',dimF,'): ');
		readln(num);
		while((dimL<dimF) and (num <> 0)) do begin
			dimL+=1;
			v[dimL]:= num;
			if (dimL<=(dimF-1)) then begin
				write('Ingrese el numero para ingresar en la posicion ',dimL+1,' (hasta la posicion ',dimF,'): ');
				readln(num);
			end;
		end;
	end;
procedure intercambio(var v:datos; x:integer; y: integer);
	var
		antiguo: integer;
	begin
		antiguo:=v[x];
		v[x]:= v[y];
		v[y]:= antiguo;
	end;
procedure imprimirVector(v:datos; dimL: integer);
	var
		i:integer;
	begin
		writeln('ELEMENTOS DEL VECTOR MODIFICADOS SEGUN LA CONSIGNA: ');
		for i:=1 to dimL do begin
			writeln('Posicion ',i,': ',v[i]);
		end;
	end;
function elementoMaximo(v:datos;dimL: integer;max:integer): integer;
	var
		i,aux: integer;
	begin
		for i:=1 to dimL do begin
			if (v[i] > max) then begin
				max:=v[i];
				aux:=i;
			end;
		end;
		elementoMaximo:=aux;
	end;
function elementoMinimo (v:datos;dimL: integer;min:integer): integer;
	var
		i,aux: integer;
	begin
		for i:=1 to dimL do begin
			if (v[i] < min) then begin
				min:=v[i];
				aux:=i;
			end;
		end;
		elementoMinimo:=aux;
	end;
var
	v:datos;
	dimL,max,min:integer;
BEGIN
	max:=-9999;
	min:=9999;
	cargarVector(v,dimL);
	intercambio(v,elementoMaximo(v,dimL,max),elementoMinimo(v,dimL,min));
	imprimirVector(v,dimL);
	writeln('El elemento maximo ',v[elementoMaximo(v,dimL,max)],' que se encontraba en la posicion ',elementoMinimo(v,dimL,min),' fue intercambiado con el elemento minimo ',v[elementoMinimo(v,dimL,min)],' que se encontraba en la posicion ',elementoMaximo(v,dimL,max),'.');
END.

