program Multiplication;

// Подключение консольного приложения
{$APPTYPE CONSOLE}

{characters-все возможные символы числа;
 firstNumber,secondNumber-переменные для хранения
 чисел;
 arrayNum-используется для запуска массива заполнения
 с правильной позицией;
 currentNum-используется для хранения текущей суммы
 двух чисел;}

var
  characters: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
  firstNumber, secondNumber: String;
  firstNumberArr, secondNumberArr, result: array of Byte;
  i, j, currentNum, arrayNum, numeralSystem: Integer;

Begin
// Ввод данных
  WriteLn('Введите первое число:');
  ReadLn(firstNumber);
  WriteLn('Введите второе число:');
  ReadLn(secondNumber);
  WriteLn('Введите систему счисления:');
  ReadLn(numeralSystem);


// Устанавливаем длину массивов
  SetLength(firstNumberArr, length(secondNumber));
  SetLength(secondNumberArr, length(secondNumber));
  SetLength(result, length(secondNumber) * 2);
  if length(firstNumber) > length(secondNumber) then
  begin
    SetLength(firstNumberArr, length(firstNumber));
    SetLength(secondNumberArr, length(firstNumber));
    SetLength(result, length(firstNumber) * 2)
  end;

// Заполняем массивы для первого и второго числа
  arrayNum := length(firstNumber) - 1;
  for i := 1 to length(firstNumber) do
    for j := 0 to (numeralSystem - 1) do
      if (copy(firstNumber, i, 1) = characters[j]) then
      begin
        firstNumberArr[arrayNum] := j;
        arrayNum := arrayNum - 1
      end;

  arrayNum := length(secondNumber) - 1;
  for i := 1 to length(secondNumber) do
    for j := 0 to (numeralSystem - 1) do
      if (copy(secondNumber, i, 1) = characters[j]) then
      begin
        secondNumberArr[arrayNum] := j;
        arrayNum := arrayNum - 1
      end;

// Умножение
  for i := 0 to (length(secondNumber) - 1) do
    for j := 0 to (length(firstNumber) - 1) do
    begin
      currentNum := (secondNumberArr[i] * firstNumberArr[j]) + result[i + j];
      result[i + j] := currentNum mod numeralSystem;
      result[i + j + 1] := result[i + j + 1] + (currentNum div numeralSystem)
    end;

// Вывод первого числа
  Writeln;
  Write('   ');
  for i := 1 to (length(result) - length(firstNumber) - 1) do
    Write(' ');
  for i := length(firstNumber) - 1 downto 0  do
    Write(characters[firstNumberArr[i]]);
  Writeln;
  Write('  *');
  Writeln;

// Вывод второго числа
  Write('   ');
  for i := 1 to (length(result) - length(secondNumber) - 1) do
    Write(' ');
  for i := length(secondNumber) - 1 downto 0  do
    Write(characters[secondNumberArr[i]]);

// Вывод результата
  Writeln;
  Write('  ');
  for i := (length(result) - 1) downto 0 do
    Write('-');
  Writeln;
  Write('  ');
  if (result[length(result) - 1] = 0) then
  begin
    SetLength(result, length(result) - 1);
    Write(' ');
  end;
  for i := (length(result) - 1) downto 0 do
    Write(characters[result[i]]);
  WriteLn;
  ReadLn;
end.

