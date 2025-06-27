{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
  e. elementoMaximo: retorna la posición del mayor elemento del vector
  f. elementoMinimo: retorna la posicion del menor elemento del vector}

program ej4;
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
function elementoMaximo (v:datos;dimL: integer;max:integer): integer;
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
	writeln('El elemento maximo del vector se encuentra en la posicion ',elementoMaximo(v,dimL,max),'.');
	writeln('El elemento minimo del vector se encuentra en la posicion ',elementoMinimo(v,dimL,min),'.');
END.

