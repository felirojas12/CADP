{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe. COMPLETO
b. Un módulo que reciba un alumno y lo inserte en el vector. COMPLETO
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0}
program ej4;
const
	df = 6;
type
	alumno = record
		nro: integer;
		nombre: string;
		asist: integer;
	end;
	vAlumn = array[1..df] of alumno;
	
procedure leerRegistro (var a: alumno);
	begin
		write('Ingrese el numero de alumno: ');
		readln(a.nro);
		write('Ingrese el nombre del alumno con numero ',a.nro,': ');
		readln(a.nombre);
		write('Ingrese su cantidad de asistencias: ');
		readln(a.asist);
	end;
	
procedure informarRegistro (a: alumno);
	begin
		writeln('Numero de Alumno: ',a.nro);
		writeln('Nombre del Alumno: ',a.nombre);
		writeln('Cantidad de Asistencias: ',a.asist);
	end;

procedure cargarAlumnos(var v: vAlumn; var dimL: integer);
	var
		a: alumno;
	begin
		dimL:=0;
		writeln('========== Ingrese la informacion del alumno que desea cargar ==========');
		leerRegistro(a);
		while ((dimL<df) and ((a.nro)<>0){no lo pide el enunciado pero lo hago para hacer la ejecucion mas corta}) do begin
			dimL+=1;
			v[dimL]:=a;
			if ((dimL<=(df-1)) and ((a.nro)<>0)) then begin
				writeln('========== Ingrese la informacion del alumno que desea cargar ==========');
				leerRegistro(a);
			end;
		end;
	end;
	
procedure informarAlumnos(v: vAlumn; dimL: integer);
	var
		i: integer;
	begin
		for i:= 1 to dimL do begin
			writeln('========== Informacion Posicion ',i,' ==========');
			informarRegistro (v[i]);
		end;
	end;
	
procedure rPosicion (v: vAlumn; dimL: integer; num: integer; var pos: integer);
	var
		i: integer;
		cumple: boolean;
	begin
		i:= 1;
		cumple:= false;
		while ((i<=dimL) and (cumple=false))do begin
			if (v[i].nro <> num) then begin
				cumple:=false;
				i+=1;
			end
			else begin
				cumple:=true;
				pos:=i;
			end;
		end;
	end;
	
function obtenerPosicion (v: vAlumn; dimL: integer; num: integer): integer;
	var
		pos,i: integer;
		cumple: boolean;
	begin
		i:= 1;
		cumple:= false;
		while ((i<=dimL) and (cumple=false))do begin
			if (v[i].nro < num) then begin
				cumple:=false;
				i+=1;
			end
			else begin
				cumple:=true;
				pos:=i;
			end;
		end;
		obtenerPosicion:=pos;
	end;

procedure insertar (a: alumno; var v: vAlumn; var dimL: integer);
	var
		i: integer;
	begin
		if (((dimL+1) <= dF) and (obtenerPosicion(v,dimL,a.nro)>=1) and (obtenerPosicion(v,dimL,a.nro)<=df)) then begin
			for i:= dimL downto obtenerPosicion(v,dimL,a.nro) do begin
				v[i+1]:=v[i];
			end;
			v[obtenerPosicion(v,dimL,a.nro)]:=a;
			dimL+=1;
		end;
	end;
	
procedure insert (var v: vAlumn; var dimL: integer; a: alumno);
	begin
		writeln('Ingrese a un alumno que quiera insertar: ');
		leerRegistro(a);
		insertar(a,v,dimL);
	end;
	
procedure search (v: vAlumn; dimL: integer);
	var
		num,posBusq: integer;
	begin
		write('Ingrese el numero de alumno que desee buscar: ');
		readln(num);
		rPosicion(v,dimL,num,posBusq);
		writeln('El alumno con numero ',v[posBusq].nro,' se encuentra en la posicion ',posBusq,'.');
	end;
	
var
	a: alumno;
	v: vAlumn;
	dimL: integer;
BEGIN
	cargarAlumnos(v,dimL);
	search(v,dimL);
	insert(v,dimL,a);
	informarAlumnos(v,dimL);
END.

