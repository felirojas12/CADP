{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el
patrón A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo
sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen}
program punto11;
function caracteres (c:char): boolean;
  begin
	caracteres:=(c<>'$');
  end;
procedure cumpleA (var cumple:boolean; var cont:integer);
  var
    caracter:char;
  begin
    writeln('Escriba la secuencia A (caracteres sin el $, se termina con el %):');
    readln(caracter);
    while ((caracter<>'%') and (cumple)) do begin
      if (not(caracteres(caracter))) then 
        cumple:=false
      else begin
        cont+=1;
        readln(caracter);
      end;
    end;
    writeln('Esta secuencia tiene ',cont,' digitos.');
  end;
procedure cumpleB (contA: integer; var cumple:boolean);
  var
    caracter:char;
    arrobas,contador:integer;
  begin
    arrobas:=0;
    contador:=0;
    writeln('Escriba la secuencia B (misma cantidad de caracteres que en la secuencia A, termina con *');
    readln(caracter);
    contador+=1;
    if (caracter='@') then
      arrobas+=1;
    while ((caracter<>'*') and (contador<contA) and (cumple)) do begin
      if (arrobas=4) then
        cumple:=false
      else begin
        readln(caracter);
        contador+=1;
        if (caracter='@') then
          arrobas+=1;
      end;
    end;
  end;
var
  cumple: boolean;
  contadorA:integer;
begin
  cumple:=true;
  contadorA:=0;
  cumpleA(cumple,contadorA);
  if cumple then begin
    cumpleB(contadorA,cumple);
    if cumple then
      writeln('Se ha cumplido el patron')
    else
      writeln('No se ha cumplido con B');
  end
  else
    writeln('No se ha cumplido con A');
end.
