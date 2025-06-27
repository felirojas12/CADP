program punto8;
var
	som:char;
	primernro,x,siguientesnro,total:integer;
begin
	siguientesnro:=0;
	x:=1;
	writeln('Ingrese el simbolo de una suma o de una resta:');
	read(som);
	if((som = '+')or(som= '-'))then
		begin
			writeln('Ingrese un numero entero (detenga la secuencia con el 0):');
			readln(primernro);
			while((primernro<>0)and(x<>0))do
				begin
					writeln('Ingrese un numero entero (detenga la secuencia con el 0):');
					readln(x);
					siguientesnro:=siguientesnro+x
				end;
			total:=primernro+siguientesnro;
			writeln('El resultado de la operacion asignada a esos numeros es ',total);
		end
	else
		writeln('ERROR: En este momento solo se pueden escribir los simbolos + y -.');
end.
		
	
