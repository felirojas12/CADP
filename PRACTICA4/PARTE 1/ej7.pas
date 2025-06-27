{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. La cantidad de ocurrencias de cada dígito procesado.
b. El dígito más leído.
c. Los dígitos que no tuvieron ocurrencias.}
program ej7;
const
	df = 9;
type
	vnumero = array [0..df] of integer;
procedure inicializar (c: vnumero);
	var
		i: integer;
	begin
		for i:=0 to df do
			c[i]:=0;
	end;
procedure descomponer (var c: vnumero; num: integer);
	var
		resto: integer;
	begin
		while (num <> 0) do begin
			resto:=num mod 10;
			c[resto]+=1;
			num:=num div 10;
		end;
	end;
procedure informoOcurrencias (c: vnumero);
	var
		i: integer;
	begin
		for i:= 0 to df do
			if (c[i] <> 0) then
				writeln('El ',i,' aparecio ',c[i],' veces.');
	end;
procedure informoCeros (c: vnumero);
	var
		i: integer;
	begin
		write('Los digitos que no tuvieron ocurrencias fueron:');
		for i:= 0 to df do
			if (c[i] = 0) then
				write(' ',i,';');
	end;
function maximo (c: vnumero; max: integer): integer;
	var
		i,dig: integer;
	begin
		for i:= 0 to df do begin
			if (c[i] > max) then begin
				max:= c[i];
				dig:= i;
			end;
		end;
		maximo:= dig;
	end;
var
	cont: vnumero;
	num,max: integer;
BEGIN
	max:=-2;
	inicializar(cont);
	write('Escriba un numero entero (-1 para terminar): ');
	readln(num);
	while (num <> -1) do begin
		descomponer(cont,num);
		write('Escriba un numero entero (-1 para terminar): ');
		readln(num);
	end;
	writeln('');
	informoOcurrencias(cont);
	writeln('');
	writeln('El digito que aparecio mas veces fue el ',maximo(cont,max),'.');
	writeln('');
	informoCeros(cont);
END.

