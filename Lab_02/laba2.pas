program laba2;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };
var
  number, duplicate1, per1, i, k, g, palindromsqr, duplicate2, per2 : integer;

Begin
{ number - вводимое число
  duplicate1 - дупликат числа number
  per1 - перевертыш числа number
  i, k - переменные цикла для создания перевертышей
  palindromsqr - палиндром в квадрате
  duplicate2 - дупликат числа palindromsqr
  per2 - перевертыш числа palindromsqr
}
  for number := 1 to 999 do
  begin
    duplicate1 := number;
    per1 := 0;
    g := 0;
    i := number;
    while i <> 0 do
    begin
      i := i div 10;
      g := g + 1;
    end;
    for i := 1 to g do
    begin
      per1 := per1*10 + duplicate1 mod 10;
      duplicate1 := duplicate1 div 10;
    end;
    if per1 = number then
    begin
      palindromsqr := number * number;
      duplicate2 := palindromsqr;
      per2 := 0;
      g := 0;
      i := palindromsqr;
      while i <> 0 do
      begin
        i := i div 10;
        g := g + 1;
      end;
      for k := 1 to g do
      begin
        per2 := per2*10 + duplicate2 mod 10;
        duplicate2 := duplicate2 div 10;
      end;
       if per2 = palindromsqr then
       begin
         Write(number, ' - палиндром. ');
         WriteLn(number, ' в квадрате также палиндром - ', palindromsqr);
       end;
    end;
  end;
readln;
End.
