Program zadacha5;
{$mode objfpc}{$H+}
Uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };
Var
  n:integer;
  x,sum,y:real;
Begin
x:=0.3;
while x<=1.3+0.001 do
  begin
  sum:=0; //Начальное значение суммы
  for n:=1 to 15 do //Запуск цикла по n(от 10 до 15)
      begin
      sum:=sum + (ln (exp((n-1)*ln(x)) + sqrt(exp(n+x)) ) / ln(10)) / (n+x);
      if n>=10 then   //Проверка условия (при n>=10 начнём вывод решений)
        begin
        y:= sin(sin(x)) / cos(sin(x)) + sum;
        writeln('n=',n,' x=',x:0:2, ' y=',y:0:3)//Вывод результатов
        end;
      end;
  x:=x+0.25;
  end;
readln
End.

