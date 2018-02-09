Program BActerii_2;
{$APPTYPE CONSOLE}

//Ввод исходных данных
Var
  n1, n2, k, red, green, i: Integer;

Begin
  Write('Введите исходное число красных бакстерий: '); readLn(n1);
  Write('Введите исходное число зелёных бакстерий: '); readLn(n2);
  Write('Введите число тактов: '); readln(k);

  //Проверка на неотрицательность введенных значений
  if (k < 0) or (n1 < 0) or (n2 < 0) then
  begin
    WriteLn('Пожалуйста попробуйте ещё:');
    WriteLn('Введите число красных бактерий, число зелёных бактерий и число тактов:');
    readLn(n1, n2, k);
  end
  else
  begin
    //Запуск цикла от 1 до k такта
    for i := 1 to k do
    begin
      red := n2;        //За такт красная становятся зелёной
      green := n1 + n2; //За такт зелёная делится на 2: красную и зелёную
      n1 := red;
      n2 := green;
    end;
  end;
  if (red > 0) and (green > 0) then
  begin
    //Вывод результатов
    WriteLn('Количество красных бактерий: ',red);
    WriteLn('Количество зелёных бактерий: ',green);
    WriteLn('Количество всех бактерий: ',red+green);
  end
  else
  writeLn('Операция не может быть выполнена');
  readLn();
end.

