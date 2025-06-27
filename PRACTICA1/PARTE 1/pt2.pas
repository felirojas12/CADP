program punto3;
var
	x,num,doble:real;
begin
	writeln('Escriba un numero');
	read(num);
	doble:=num*2;
	writeln('Escriba un numero distinto al doble de su primero dado');
	read(x);
	while(x<>doble)do
		begin
			writeln('Escriba otro numero con las mismas propiedades que el anterior');
			read(x)
		end
end.
		
	
