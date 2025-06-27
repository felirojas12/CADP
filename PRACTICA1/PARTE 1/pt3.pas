program punto3;
var
	x,num,doble:real;
	intentos: integer;
begin
	intentos:=0;
	writeln('Escriba un numero');
	read(num);
	doble:=num*2;
	writeln('Escriba un numero distinto al doble de su primero dado');
	read(x);
	while((x<>doble) and (intentos<9))do
		begin
			intentos+=1;
			writeln('Escriba un numero distinto al doble de su primero dado');
			read(x);
		end
end.
		
	
