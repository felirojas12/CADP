{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por
universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}


program punto7;
type
	centro = record
		nombre: string;
		universidad: string;
		investigadores: integer;
		becarios: integer;
	end;
procedure leer(var c: centro);
	begin
		write('Ingrese el nombre abreviado del centro de investigacion: ');
		readln(c.nombre);
		write('Ingrese la universidad a la que pertenece ',c.nombre,': ');
		readln(c.universidad);
		write('Ingrese la cantidad de investigadores del centro: ');
		readln(c.investigadores);
		write('Ingrese la cantidad de becarios del centro: ');
		readln(c.becarios);
	end;
procedure maximo (uni: string; inv: integer; var max: integer; var unimax: string);
	begin
		if (inv>max) then begin
			max:= inv;
			unimax:=uni;
		end;
	end;
procedure minimos (cen: string; bec: integer; var cen1: string;var cen2: string; var min1: integer; var min2: integer);
	begin
		if (bec<min1) then begin
			min2:=min1;
			min1:=bec;
			cen2:=cen1;
			cen1:=cen;
		end;
		if ((bec>min1) and (bec<min2)) then begin
			min2:=bec;
			cen2:=cen;
		end;
	end;
var
	centros,investotales,max,min1,min2: integer;
	c: centro;
	actual,unimax,cen1,cen2: string;
BEGIN
	min1:=9999;
	min2:=9999;
	max:=-1;
	leer(c);
	while (c.investigadores <> 0) do begin
		actual:=c.universidad;
		investotales:=0;
		centros:=0;
		while ((c.investigadores <> 0) and (actual = c.universidad)) do begin
			centros+=1;
			investotales+=c.investigadores;
			maximo(c.universidad,investotales,max,unimax);
			minimos(c.nombre,c.becarios,cen1,cen2,min1,min2);
			leer(c);
		end;
		writeln('La ',actual,' tiene ',centros,' centros de investigacion.');
	end;
	writeln('La universidad con mayor cantidad de investigadores en sus centros es la ',unimax,'.');
	writeln('Los dos centros con menor cantidad de becarios fueron ',cen1,' y ',cen2,', respectivamente.');
END.

