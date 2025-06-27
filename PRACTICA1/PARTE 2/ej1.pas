{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}
program punto1a;
var
	mayora5,i,nro,total:integer;
begin
	mayora5:=0;
	total:=0;
	for i:=1 to 10 do begin
		writeln('Ingrese un numero entero:');
		readln(nro);
		total+=nro;
		if (nro>5) then begin
			mayora5+=1
		end;
	end;
	writeln('La suma de todos esos numeros es: ',total);
	writeln('La cantidad de numeros mayores a 5 ingresados es de: ',mayora5);
end.
	
