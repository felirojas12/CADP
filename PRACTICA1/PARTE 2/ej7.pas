{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se
lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100
autos. Informar en pantalla:
● Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
● Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}
program punto7;
var
	i,tiempo,max1,max2,min1,min2:integer;
	nombre,nombremax1,nombremax2,nombremin1,nombremin2:string;
begin
	max1:=-32768;
	max2:=-32768;
	min1:=32767;
	min2:=32767;
	for i:=1 to 5 do begin
		writeln('Escriba el nombre del piloto del auto:');
		readln(nombre);
		writeln('Escriba el tiempo total (en minutos) que le tomo finalizar la carrera:');
		readln(tiempo);
		if (tiempo>max1) then begin
			max2:=max1;
			max1:=tiempo;
			nombremax1:=nombre;
		end;
		if ((tiempo<max1) and (tiempo>max2)) then begin
			max2:=tiempo;
			nombremax2:=nombre;
		end;
		if (tiempo<min1) then begin
			min2:=min1;
			min1:=tiempo;
			nombremin1:=nombre;
		end;
		if ((tiempo>min1) and (tiempo<min2)) then begin
			min2:=tiempo;
			nombremin2:=nombre;
		end;
	end;
	writeln('En el primer puesto quedo ',nombremin1,' y en el segundo quedo ',nombremin2);
	writeln('En el ultimo puesto quedo ',nombremax1,' y en el penultimo quedo ',nombremax2);
end.
