{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el
patrón A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
program ej10;
function solovocales(car: char):boolean;
	begin
		solovocales:=(car='a') or (car='e') or (car='i') or (car='o') or (car='u');
	end;
function alfabeto(car: char): boolean;
	begin
		alfabeto := (car >= 'a') and (car <= 'z');
	end;
procedure cumpleA (var cumple: boolean);
	var
		c:char;
	begin
		writeln('Ingrese la secuencia A (solo letras vocales minusculas):');
		readln(c);
		while ((c <> '$') and (cumple)) do begin
			if (not solovocales(c)) then begin
				writeln('ERROR: Se ingreso un caracter distinto a una vocal minuscula');
				cumple:=false;
			end
			else
				readln(c);
		end;
	end;
procedure cumpleB (var cumple: boolean);
	var
		c:char;
	begin
		writeln('Ingrese la secuencia B (solo letras consonantes minusculas):');
		readln(c);
		while ((c <> '#') and (cumple)) do begin
			if ((solovocales(c)) or (not (alfabeto(c)))) then begin
				writeln('ERROR: Se ingreso un caracter distinto a una consonante');
				cumple:=false;
			end
			else
				readln(c);
		end;
	end;
var
	cumple:boolean;
BEGIN
	cumple:=true;
	cumpleA(cumple);
	if cumple then begin
		cumpleB(cumple);
		if cumple then
			writeln('Se cumplieron ambas secuencias')
		else 
			writeln('No cumple con la SECUENCIA B');
	end
	else
		writeln('No cumple con la SECUENCIA A');
END.

