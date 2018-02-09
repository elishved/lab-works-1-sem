program Laba_3_random;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

const
  n = 10;
type
    Mas=array[1..n] of Integer;
Var
  A: Mas;
  i, j, m: Integer;

Begin
//определение размерности массива
  m:=n;
//инициализация массива в диапазоне от 0 до 100
  randomize;
  for i := 1 to m do
    A[i] := random(100);
//вывод исходного массива
  Writeln('Исходный массив: ');
  for i := 1 to m do
    Write(A[i],' ');

//присваиваем i-тому номеру номер 2-ого элемента
  i := 2;
//запуск цикла А1. Рассматриваем элементы, начиная со второго
  While i <= m do
     if (A[i+1] > A[i-1]) and (A[i+1] < A[i]) then
     begin
       for j := i+1 to m do
       A[j-1] := A[j];
       m := m-1;
     end
     else
       //проверяем какой из двух соседних элементов больше
       if A[i] < A[i-1]
       //если элемент меньше либо равен предыдущему, мы его удаляем и сдвигаем массив влево на один элемент
       then
       begin
         For j := i+1 to m do
         A[j-1] := A[j];
         m := m - 1;
       end
       //если нет, переходим к проверке следующего элемента
       else
       i := i + 1;
//изменяем i, чтобы проверять все элементы
  i:=i-1;

//вывод полученного массива
  Writeln;
  Writeln('Преобразованный массив: ');
  for i := 1 to m do
    Write(A[i],' ');
  Readln;

end.

