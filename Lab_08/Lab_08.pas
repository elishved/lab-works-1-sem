﻿program Lab_08;
//Дана последовательность, содержащая от 2 до 50 слов,
//в каждом из которых от 1 до 8 строчных латинских букв;
//между соседними словами - запятая или не менее одного
//пробела, за последним словом - точка. Напечатать те слова
//последовательности, которые отличны от последнего слова,
//предварительно преобразовав каждое из них по следующему //правилу: оставить в слове только последнее вхождение
//каждой буквы.

// Подключение консольного приложения
{$APPTYPE CONSOLE}

Var
{user - последовательность слов;
 w – массив слов}
user,w: String;

{ws - элементы промежуточного массива слов;
 ss - массив слов}
ws,ss: array[1..50] of String[8];

{len - длина последовательности слов;
 i,j - номер буквы слова;
 q,k - номер слова;
 j1,j2 - промежуточная переменная;
 ch - счётчик}
len: Integer;
i,j,q,k,j1,j2,ch: Integer;

Begin
// Ввод строки со словами
  Writeln('Введите последовательность из 2-50 слов,содержащих от 1 до 8 строчных латинских букв. ');
  Writeln('В противном случае некорректные символы будут удалены.');
  Read(user);

// Определяем длину введенной строки
  len:=Length(user);

// Преобразуем слова из строки в элементы массива
  i:=1;
  q:=0;
  while i <= len do
  begin
    if user[i] in ['a'..'z'] then
    begin
      w:=user[i];
      i:=i + 1;

// Побуквенно собираем слово
      while (i <= len) and (user[i] in ['a'..'z']) do
      begin
        w:=w + user[i];
        i:=i + 1;
      end;

// Записываем полученное слово в массив
      j:=1;
      while j <= q do
         j:=j + 1;
      if j > q then
      begin
        q:=q + 1;
        ws[q]:=w;
      end;
    end
    else
      i:=i + 1;
  end;

  Writeln;
  Writeln('Преобразованные по правилу слова: ');

// Преобразовываем слова, оставляя только последние
// вхождения букв
  for k:=1 to q do
  begin
// Убираем все удаленные символы, создавая новую строку
    ss[k]:='';
    for i:=1 to Length(ws[k])-1 do
      for j:=i+1 to Length(ws[k]) do
        if ws[k][i]=ws[k][j] then delete(ws[k],i,1);
    ss[k]:=ws[k];
    Write(ss[k],' ');
  end;

// Находим слова, отличные от последнего
  Writeln;
  Writeln;
  Writeln('Слова, отличные от последнего:');

// Инициализируем счетчик
  ch:=0;
  for k := 1 to q do
  begin
    if ss[k]<>ss[q] then
    begin
      ch:=ch+1;
      Write(ss[k],' ');
    end;
  end;
// Если счетчик равен нулю, таких слов нет
  if ch=0 then
  Writeln('Таких слов нет.');
  Readln;
  Readln
end.
