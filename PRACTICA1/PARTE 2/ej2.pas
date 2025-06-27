program punto2a;
var
	i,nro,max,pos,posmax:integer;
begin
	max:=-1;
	pos:=0;
	for i:=1 to 10 do begin
		writeln('Escriba un numero entero: ');
		readln(nro);
		pos+=1;
		if(nro>max)then begin
			max:=nro;
			posmax:=pos;
		end;
	end;
	writeln('El numero mas grande es: ',max,' y se encontraba en la posicion ',posmax);
end.
