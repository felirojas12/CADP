program punto7;
var
	caracter:char;
	veces,consonantes:integer;
begin
	veces:=0;
	consonantes:=0;
	while(veces<3)do
		begin
			veces+=1;
			writeln('Escriba una letra');
			read(caracter);
			if ((caracter <> 'a')and(caracter <> 'e')and(caracter <> 'i')and(caracter <> 'o')and(caracter <> 'u')and(caracter <> 'A')and(caracter <> 'E')and(caracter <> 'I')and(caracter <> 'O')and(caracter <> 'U')) then
				consonantes+=1;
		end;
	if (consonantes>=1) then
		writeln('Al menos un caracter no era vocal')
	else
		writeln('Los tres eran vocales');
end.
		
	
