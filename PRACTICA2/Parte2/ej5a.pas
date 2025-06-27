program punto5a;
procedure esDoble(numA,numB:integer;var es:boolean);
	begin
		es:=(numB=(2*numA));
	end;
var
	nro1,nro2,cant1,cant2:integer;
	true:boolean;
BEGIN
	cant1:=0;
	cant2:=0;
	writeln('Ingrese dos numeros: ');
	read(nro1);
	read(nro2);
	while ((nro1<>0) or (nro2<>0)) do begin
		esDoble(nro1,nro2,true);
		cant1+=1;
		if true then
			cant2+=1;
		writeln('Ingrese dos numeros: ');
		read(nro1);
		read(nro2);
	end;
	writeln('Se leyeron ',cant1,' pares de numeros');
	writeln('En ',cant2,' casos el segundo numero fue el doble del primero');
END.

