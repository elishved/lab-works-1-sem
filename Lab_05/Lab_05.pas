program Lab_05;

{В магазине первый понедельник каждого месяца проводит-
 ся переучёт товаров. Дано число, обозначающее номер
 года. Определить для каждого месяца этого года все
 числа месяцев, на который приходится день переучёта.
 (Минимальное значение начала временного периода 1-ый
 год, максимальное значение конца – 3000-ый год).

 Для определения числа месяца первого понедельника
 каждого месяца 1-го года используются пользовательские
 типы данных.
 Далее учитывается смещение дня недели на 1 или 2 дня
 каждый год, на основании которого высчитывается число
 месяца первого понедельника каждого месяца указанного
 года.
 В качестве точки отсчета был взят понедельник, 1-е ян-
 варя 1-го года.}

//Подключение консольного приложения
{$APPTYPE CONSOLE}

type
{TDayOfMonth - пользовательский тип данных (дни
               месяца)
 TDayOfWeek  - пользовательский тип данных (дни
               недели)
 TMonth      - пользовательский тип данных (месяцы)}

  TDayOfMonth = 1..31;
  TDayOfWeek = (Mon, Tue, Wed, Thu, Fri, Sat, Sun);
  TMonth = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug,
            Sep, Oct, Nov, Dec);


var
  {year     - указанный год, в котором ведется поиск
              числа месяца
   i        - текущий год
   month    - текущий месяц
   num      - день недели
   numlimit - граница числа дней месяца
   day      - день недели, на который приходится
              1 января
   offset   - смещение 1 января в текущем году
   MonthDay - последний день в месяце}

  year, i, numlimit, offset : Integer;
  MonthDay, day: TDayOfWeek;
  num: TDayOfMonth;
  month: TMonth;
  flag : Boolean;

Begin
// Ввод номера года
  Write('Введите номер года: ');
  Readln(year);

// Проверка на корректность введенных данных
  if year<1 then
  begin
    Write('Вы неккоректно ввели данные! Попробуйте еще:');
    Readln(year);
  end;

// В качестве точки отсчета был взят понедельник,
// 1-е января 1-го года
  num := 1;
  day := Mon;

// Определяем, является ли год високосным
  flag:=false;
  for i:=num+1 to year do
  begin
    if (i mod 400 = 0) then      // условие високосности №1
       offset:=2
    else
      if (i mod 100 = 0) then
         offset:=1
      else
        if (i mod 4 = 0) then    // условие високосности №2
           offset:=2
        else
          offset:=1;

// Определяем день недели, на который приходится 1
// января
// В зависимости от високосности года смещаем 1 января
// на 1 или 2 дня
    if offset=2 then
    begin
      flag:=true;
      if day=Sun then
         day:=Mon
      else
        day:=Succ(day);
    end
    else
    begin
      if flag=true then
      begin
        if day=Sun then
           day:=Mon
        else
          day:=Succ(day);

        if day=Sun then
           day:=Mon
        else
          day:=Succ(day)
      end
      else
      begin
        if day=Sun then
           day:=Mon
        else
          day:=Succ(day);
      end;
      flag:=false;
    end;
  end;

// Находим первый понедельник месяца и его дату
  MonthDay:=day;
  for month:=Jan to Dec do
    begin
      num:=1;
      while (MonthDay<>Mon) do
      begin
        num:=num+1;
        if MonthDay=Sun then
           MonthDay:=Mon
        else
          MonthDay:=Succ(MonthDay)
      end;
// Выводим результаты
      case month of
        Jan:writeln('День переучёта товара будет ',num,
                    ' числа в январе.');
        Feb:writeln('День переучёта товара будет ',num,
                    ' числа в феврале.');
        Mar:writeln('День переучёта товара будет ',num,
                    ' числа в марте.');
        Apr:writeln('День переучёта товара будет ',num,
                    ' числа в апреле.');
        May:writeln('День переучёта товара будет ',num,
                    ' числа в мае.');
        Jun:writeln('День переучёта товара будет ',num,
                    ' числа в июне.');
        Jul:writeln('День переучёта товара будет ',num,
                    ' числа в июле.');
        Aug:writeln('День переучёта товара будет ',num,
                    ' числа в августе.');
        Sep:writeln('День переучёта товара будет ',num,
                    ' числа в сентябре.');
        Oct:writeln('День переучёта товара будет ',num,
                    ' числа в октябре.');
        Nov:writeln('День переучёта товара будет ',num,
                    ' числа в ноябре.');
        Dec:writeln('День переучёта товара будет ',num,
                    ' числа в декабре.');
      end;

// В зависимости от високосности года определяем
// количество дней в каждом месяце
      if offset=1 then
      begin
        case month of
// 28 в феврале,  т.к. 1 год - не високосный
          Feb: numlimit := 28;
// 30 в апреле, июне, сентябре и ноябре
          Apr, Jun, Sep, Nov: numlimit := 30
        else
// 31 в остальных месяцах
          numlimit := 31
        end;
      end
      else
      begin
        case month of
// 29 в феврале, т.к. 1 год - високосный
          Feb: numlimit := 29;
// 30 в апреле, июне, сентябре и ноябре
          Apr, Jun, Sep, Nov: numlimit := 30
        else
// 31 в остальных месяцах
          numlimit := 31;
        end;
      end;

// Находим последний день текущего месяца, чтобы потом
// найти день недели, на который приходится 1 число
// месяца
      MonthDay:=Mon;
      while num <> numlimit do
      begin
        if MonthDay=Sun then
           MonthDay:=Mon
        else
          MonthDay:=Succ(MonthDay) ;
        num:=num+1;
      end;
      if MonthDay=Sun then
         MonthDay:=Mon
      else
        MonthDay:=Succ(MonthDay) ;
    end;
  readln;
end.

