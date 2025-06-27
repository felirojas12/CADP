{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido,
nombre y año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a. El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b. Apellido y nombre de los dos alumnos de mayor edad.}


program ej8;
const
	df = 3;
type
	rango = 1..df;
	alumno = record
		inscripcion: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		ano: integer;
	end;
	vector = array [rango] of alumno;
procedure leerAlumno (var a: alumno);
	begin
		write('Escriba el numero de inscripcion del alumno: ');
		readln(a.inscripcion);
		write('Escriba el DNI del alumno: ');
		readln(a.dni);
		write('Escriba el apellido del alumno con DNI ',a.dni,': ');
		readln(a.apellido);
		write('Escriba el nombre del alumno con DNI ',a.dni,' y apellido ',a.apellido,': ');
		readln(a.nombre);
		write('Escriba el ano de nacimiento del alumno ',a.apellido,' ',a.nombre,': ');
		readln(a.ano);
	end;
function esPar (dni:integer):boolean;
var
	seguir:boolean;
	dig:integer;
begin
	seguir:=true;
	while(dni <> 0) and (seguir) do begin
			dig:= dni mod 10;
			if((dig mod 2) = 0)then begin
				seguir:=true;
				dni:= dni div 10;
			end
			else
			seguir:=false;
	end;
	esPar:=seguir;
end;
procedure mayorEdad (ano: integer; ape: string; var min1: integer; var min2: integer; var apellido1: string; var apellido2: string);
	begin
		if ano<min1 then begin
			min2:= min1;
			min1:= ano;
			apellido2:= apellido1;
			apellido1:= ape;
        end;
		if ((ano>min1) and (ano<min2)) then begin
			min2:=ano;
			apellido2:= ape;
		end;
	end;
procedure cargarAlumnado (var a: vector; var dnipares: integer;var min1: integer;var min2: integer; var ape1: string; var ape2: string);
	var
		i: rango;
	begin
		for i:= 1 to df do begin
			leerAlumno(a[i]);
			writeln(''); {espacio}
			if esPar(a[i].dni) then
				dnipares+=1;
			mayorEdad(a[i].ano,a[i].apellido,min1,min2,ape1,ape2);
		end;	
	end;
function porcentaje (dnip: integer): real;
	begin
		porcentaje:= ((dnip/df)*100);
	end;
var
	a: vector;
	min1,min2,dnipares: integer;
	ape1,ape2: string;
BEGIN
	min1:=9999; 
	min2:=9999;
	dnipares:=0;
	cargarAlumnado(a,dnipares,min1,min2,ape1,ape2);
	writeln('');
	writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares es de ',porcentaje(dnipares):0:2,'%.');
	writeln('');
	writeln('Apellido del alumno mas grande: ',ape1);
	writeln('Apellido del segundo alumno mas grande: ',ape2);
END.

