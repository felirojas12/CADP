program punto5;
var
	legajo,alumnos,pro1,prod: integer;
	promedio: real;
	porcentaje: real;
begin
	legajo:=0;
	alumnos:=0;
	pro1:=0;
	prod:=0;
	while (legajo<>-1)do
		begin
			writeln('Escriba el numero de legajo del alumno');
			read(legajo);
			if(legajo<>-1)then
				begin
					writeln('Escriba el promedio del alumno seleccionado');
					read(promedio);
					alumnos+=1;
					if (promedio>6.5)then
						begin
							pro1+=1;
						end;
					if ((promedio>8.5) and (legajo<2500))then
						begin
							prod+=1;
						end;
				end;	
		end;
	writeln('La cantidad de alumnos leida fue de ',alumnos);
	writeln('La cantidad de alumnos cuyo promedio supera los 6,5 puntos son ',pro1);
	porcentaje:= (prod/alumnos)*100;
	writeln('El porcentaje de alumnos con esas caracteristicas es ',porcentaje:4:2,'%');
end.
		
	
