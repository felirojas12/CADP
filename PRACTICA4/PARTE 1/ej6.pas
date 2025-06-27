{Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo
y otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva
ambas posiciones.}
program ej6;
const
	dimF = 6;
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
procedure maxymin(v:datos; dimL:integer; max:integer; min:integer;var posmax:integer;var posmin:integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			if (v[i] > max) then begin
				max:=v[i];
				posmax:=i;
			end;
			if (v[i] < min) then begin
				min:=v[i];
				posmin:=i;
			end;
		end;
	end;
var
	v:datos;
	dimL,max,min,posmax,posmin:integer;
BEGIN
	posmax:=0;
	posmin:=0;
	max:=-9999;
	min:=9999;
	cargarVector(v,dimL);
	maxymin(v,dimL,max,min,posmax,posmin);
	intercambio(v,posmax,posmin);
	imprimirVector(v,dimL);
	writeln('El elemento maximo ',v[posmin],' que se encontraba en la posicion ',posmax,' fue intercambiado con el elemento minimo ',v[posmax],' que se encontraba en la posicion ',posmin,'.');
END.


