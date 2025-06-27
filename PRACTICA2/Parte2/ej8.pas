{Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando
llega el número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus
dígitos pares y la cantidad de dígitos impares que posee.}
program ej8;
procedure analisis(num:integer;var suma,impares:integer);
	var
		esPar:boolean;
		resto:integer;
	begin
		while (num <> 0) do begin
			resto:=num mod 10;
			esPar:=(resto mod 2=0);
			if esPar then
				suma+=resto
			else
				impares+=1;
			num:= num div 10;
		end;
	end;
var
	nro,cant1,cant2,sumaTotal,digitosTotales:integer;
BEGIN
	sumaTotal:=0;
	digitosTotales:=0;
	writeln('Escriba un numero entero (detengase con 12345):');
	readln(nro);
	while (nro <> 12345) do begin
		cant1:=0;cant2:=0;
		analisis(nro,cant1,cant2);
		sumaTotal+=cant1;
		digitosTotales+=cant2;
		readln(nro);
	end;
	writeln(sumaTotal,' y ',digitosTotales);
END.

