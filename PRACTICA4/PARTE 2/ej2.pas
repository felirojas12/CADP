{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias}


program ej2;
const
	df = 6;
type
	rango = 0..df;
	valumnos = array [1..df] of string;
procedure cargarVector(var v:valumnos; var dimL: rango);
	var
		ape: string;
	begin
		dimL:=0;
		write('Escriba el nombre del alumno: ');
		readln(ape);
		while ((dimL<df) and (ape <> 'ZZZ')) do begin
			dimL+=1;
			v[dimL]:=ape;
			if (dimL<=(df-1)) then begin
				write('Escriba el nombre del alumno: ');
				readln(ape);
			end
			else
				writeln('Se ocuparon los ',df,' espacios del vector. Ya no se pueden ingresar mas alumnos.');
		end;
	end;
	
procedure informarVector(var v:valumnos;var dimL: rango);
	var
		i: rango;
	begin
		for i:=1 to dimL do begin
			writeln('Posicion ',i,': ',v[i]);
		end;
	end;
	
{usado unicamente en eliminar}
procedure buscar(var v:valumnos; b: string; var posbusqueda: rango; dimL: rango);
	var
		pos: rango;
		cumple: boolean;
	begin
		pos:=1;
		cumple:= false;
		while ((pos<=dimL) and (cumple=false)) do begin
			if (v[pos] = b) then begin
				posbusqueda:= pos;
				cumple:=true;
			end
			else begin
				pos+=1;
				cumple:=false;
			end;
		end;
	end;
{usado unicamente en eliminar}

procedure eliminar(var v:valumnos; var dimL: rango);
	var
		b: string;
		posElim,i: rango;
	begin
		write('Ingrese el nombre de la lista que desee eliminar: ');
		readln(b);
		buscar(v,b,posElim,dimL);
		if ((posElim>=1) and (posElim<=df)) then begin
			for i:= posElim to (dimL-1) do begin
				v[i]:=v[i+1];
			end;
			dimL:=dimL-1;
		end;
		
	end;
	
procedure insertar(var v:valumnos; var dimL: rango; pos: rango);
	var
		i: rango;
		b: string;
	begin
		write('Ingrese a un alumno para ingresar en la posicion ',pos,': ');
		readln(b);
		if ((dimL<df) and (pos>=1) and (pos<=dimL)) then begin
			for i:=dimL downto pos do begin
				v[i+1]:=v[i];
			end;
			v[pos]:=b;
			dimL:=dimL+1;
		end
		else
			writeln('ERROR: No hay lugar para insertar el nombre.');
	end;

procedure agregar(var v:valumnos; var dimL: rango);
	var
		b: string;
	begin
		write('Ingrese a un alumno para agregar al final del vector: ');
		readln(b);
		if ((dimL+1) <= df) then begin
			dimL:=dimL+1;
			v[dimL]:=b;
		end;
	end;
	
var
	v: valumnos;
	dimL: rango;
BEGIN
	cargarVector(v,dimL);
	writeln('');
	eliminar(v,dimL);
	writeln('');
	informarVector(v,dimL);
	writeln('');
	insertar(v,dimL,4);
	writeln('');
	informarVector(v,dimL);
	writeln('');
	agregar(v,dimL);
	writeln('');
	informarVector(v,dimL);
END.

