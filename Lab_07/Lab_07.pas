Program laba_7;
//Дана матрица X[1..8,1..5].Упорядочить элементы
//столбцов матрицы по невозрастанию, а сами
//столбцы по невозрастанию сумм элементов столбцов
{$APPTYPE CONSOLE}

Var
  X:array[1..8,1..5] of Integer; //Исходная матрица
  Y:array[1..5] of Integer;//Массив с суммами элементов столбцов
  i,j,m,p: Integer; //Счётчики циклов
  t,sum,max: Integer; //Для сохранения значения ячейки массива

Begin

  //Заполнение исходной матрицы с помощью генератора случайных чисел
  randomize;
  for i:=1 to 8 do
    for j:=1 to 5 do
      X[i,j]:=random(100);

  //Вывод исходной матрицы
  writeln('               Исходная матрица');
  writeln;
  for i:=1 to 8 do
  begin
    for j:=1 to 5 do
      write(X[i,j]:5);
  writeln;
  writeln;
  end;

  //Сортировка элементов столбцов по невозрастанию
  for j:=1 to 5 do
  begin
    for i := 1 to 7 do
    begin
      max:=i;
      for m:=i+1 to 8 do
      begin
        if X[m,j]>X[max,j] then
        max:=m;
      end;
      t:=X[i,j];
      X[i,j]:=X[max,j];
      X[max,j]:=t
    end
  end;

  //Вывод матрицы после сортировки элементов в столбцах
  writeln('---------------------------------------------');
  writeln('               Промежуточная матрица');
  writeln;
  for i:=1 to 8 do
  begin
    for j:=1 to 5 do
      write(X[i,j]:5);
  writeln;
  writeln;
  end;


  //Нахождение сумм элементов столбцов и занесение их в массив
  for j:=1 to 5 do
  begin
    sum:=0;
    for i:=1 to 8 do
    begin
      sum:=sum+X[i,j];
    end;
    Y[j]:=sum;
  end;

 //Вывод массива с суммами элементов столбцов
  writeln('---------------------------------------------');
  writeln('               Массив с суммами элементов');
  writeln;
  for j:=1 to 5 do
    Write(Y[j]:5);
  writeln;
  writeln;


  //Сортируем столбцы по невозрастанию сумм элементов столбцов
  for i:=2 to 8 do
    for j:=5 downto i do
  //Сортируем массив с суммами элементов
      if Y[j-1]<=Y[j] then
      begin
        t:=Y[j-1];
        Y[j-1]:=Y[j];
        Y[j]:=t;

  //Сортируем непосредственно столбцы в матрице
        for p:=1 to 8 do
        begin
          t:=X[p,j-1];
          X[p,j-1]:=X[p,j];
          X[p,j]:=t;
        end;
      end;


  //Вывод полученной матрицы
  writeln('---------------------------------------------');
  writeln('               Полученная матрица');
  writeln;
  for i:=1 to 8 do
  begin
    for j:=1 to 5 do
      write(X[i,j]:5);
  writeln;
  writeln
  end;
  readln
end.

