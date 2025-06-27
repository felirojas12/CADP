{El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se
ingresa el valor 0 (que no debe procesarse) o cuando el vector está completo.}

program ej2;
const
	dimF = 150;
type
	datos = array[1..dimF] of real; 
procedure cargarVector(var v:datos; var dimL: integer);
	var
		num:real;
	begin
		dimL:=0;
		write('Ingrese el numero para ingresar en la posicion ',dimL+1,' (hasta la posicion ',dimF,'): ');
		readln(num);
		while((dimL<dimF) and (num <> 0) do begin
			dimL+=1;
			v[dimL]:= num;
			write('Ingrese el numero para ingresar en la posicion ',dimL+1,' (hasta la posicion ',dimF,'): ');
			readln(num);
		end;
	end;
BEGIN
	
	
END.

