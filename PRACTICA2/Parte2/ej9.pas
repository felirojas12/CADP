{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número
de inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Apellido de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.} 
program ej9;
procedure dosmaximos(numerodeinscripcion: integer; apellidodelalumno: string;var max1,max2: integer; var 
apellidogrande1,apellidogrande2:string);
	begin
		if (numerodeinscripcion>max1) then begin
			max2:=max1;
			max1:=numerodeinscripcion;
			apellidogrande2:=apellidogrande1;
			apellidogrande1:=apellidodelalumno;
		end;
		if (numerodeinscripcion<max1) and (numerodeinscripcion>max2) then begin
			max2:=numerodeinscripcion;
			apellidogrande2:=apellidodelalumno;
		end;
	end;
procedure dosminimos(numerodeinscripcion: integer; apellidodelalumno: 
string;var min1,min2: integer; var apellidochico1,apellidochico2: string); 
	begin
		if (numerodeinscripcion<min1) then begin
			min2:=min1;
			min1:=numerodeinscripcion;
			apellidochico2:=apellidochico1;
			apellidochico1:=apellidodelalumno;
		end;
		if ((numerodeinscripcion>min1) and (numerodeinscripcion<min2)) then begin
			min2:=numerodeinscripcion;
			apellidochico2:=apellidodelalumno;
		end;
	end;
function esPar (numero:integer): boolean;
	begin
		esPar:=((numero mod 2)=0)
	end;
function porcentaje(pares,totales: real): real;
	begin
		porcentaje:=((pares/totales)*100);
	end;
var 
	nro,max1,max2,min1,min2: integer;
	pares,totales: real;
	apellido,nombre,apemax1,apemax2,apemin1,apemin2: string;
BEGIN
	pares:=0;
	totales:=0;
	max1:=-1;
	max2:=-1;
	min1:=9999;
	min2:=9999;
	repeat
		writeln('Escriba el numero de inscripcion del alumno:');
		readln(nro);
		writeln('Escriba el apellido del alumno:');
		readln(apellido);
		writeln('Escriba el nombre del alumno con apellido ',apellido,':');
		readln(nombre);
		totales+=1;
		if esPar(nro) then
			pares+=1;
		dosminimos(nro,apellido,min1,min2,apemin1,apemin2);
		dosmaximos(nro,apellido,max1,max2,apemax1,apemax2);
	until (nro=1200);
	writeln('El alumno ',apemin1,' tuvo el numero de inscripcion mas chico, y ',apemin2,' tuvo el segundo mas chico.');
	writeln('El alumno ',apemax1,' tuvo el numero de inscripcion mas grande, y ',apemax2,' tuvo el segundo mas grande.');
	writeln('El porcentaje de alumnos con numero de inscripcion par fue de ',porcentaje(pares,totales):3:2,'%');
END.

