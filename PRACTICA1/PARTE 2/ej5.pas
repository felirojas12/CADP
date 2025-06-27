{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el
número 100, el cual debe procesarse. Informar en pantalla:
● El número máximo leído.
● El número mínimo leído.
● La suma total de los números leídos}
program punto5;
var
	nro,max,min,total:integer;
begin
	total:=0;
	max:=-32768;
	min:=32767;
	repeat
		writeln('Ingrese un numero entero: ');
		readln(nro);
		total+=nro;
		if(nro>max)then
			max:=nro;
		if(nro<min) then
			min:=nro;
	until(nro=100);
	writeln('El numero maximo leido fue: ',max);
	writeln('El numero minimo leido fue: : ',min);
	writeln('El total de la suma de todos los numeros fue de: ',total);
end.
