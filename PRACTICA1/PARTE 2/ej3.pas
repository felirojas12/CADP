{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera Analista en
TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe procesarse. Al finalizar la lectura
informar:
● La cantidad de alumnos aprobados (nota 8 o mayor).
● La cantidad de alumnos que obtuvieron un 7 como nota.}
program punto3;
var
	nombre:string;
	nota:real;
	siete,ocho:integer;
begin
	siete:=0;
	ocho:=0;
	repeat
		writeln('Ingrese el nombre del alumno');
		readln(nombre);
		writeln('Ingrese la nota de dicho alumno en el modulo EPA');
		readln(nota);
		if(nota=7) then
			siete+=1;
		if(nota<=8) then
			ocho+=1;	
	until(nombre='Zidane Zinedine');
	writeln('La cantidad de alumnos con nota 8 o mayor en EPA es de: ',ocho);
	writeln('La cantidad de alumnos con nota 7 en EPA es de: ',siete);
end.
