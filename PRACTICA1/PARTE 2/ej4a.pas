{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son los dos
números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer el
número 0, el cual no debe procesarse.}
program punto4;
var
	i,nro,min1,min2:integer;
begin
	min1:=32767;
	min2:=32767;
	writeln('Escriba un numero entero: ');
	readln(nro);
	while (nro<>0) do begin
		if (nro<min1) then begin
			min2:=min1;
			min1:=nro;
		end;
		if ((nro>min1) and (nro<min2)) then
			min2:=nro;
		writeln('Escriba un numero entero: ');
		readln(nro);
	end;
	writeln('El numero mas chico fue ',min1,' y el segundo mas pequeño fue ',min2)
end.
