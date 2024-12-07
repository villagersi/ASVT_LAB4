Этот проект реализует параллельное умножение матриц с использованием библиотеки MPI (Message Passing Interface) в языке C#. Программа распределяет задачи между несколькими процессами, что позволяет эффективно использовать ресурсы многопроцессорных систем.
Описание программы
Основные компоненты

    Импорт библиотек:

    csharp
    using MPI;
    using System.Diagnostics;

Здесь мы подключаем необходимые пространства имен, включая MPI для работы с параллельными вычислениями и System.Diagnostics для измерения времени выполнения.
Главный класс и метод:

csharp
class Program
{
    static void Main(string[] args)
    {
        ...
    }
}

    Основной класс Program содержит метод Main, который запускает программу.

Инициализация MPI

csharp
MPI.Environment.Run(ref args, communicator =>
{
    int rank = communicator.Rank;
    int size = communicator.Size;
    ...
});

    MPI.Environment.Run инициализирует среду MPI и предоставляет объект communicator, который используется для обмена сообщениями между процессами.
    rank — это уникальный идентификатор процесса (от 0 до size-1).
    size — общее количество процессов.

Определение размеров матриц

csharp
int rowsA = 100; // Количество строк в первой матрице
int colsA = 100; // Количество столбцов в первой матрице (и строк во второй)
int colsB = 100; // Количество столбцов во второй матрице

Здесь задаются размеры двух матриц: A (размером 100x100) и B (размером 100x100).
Заполнение матриц
Процесс 0 (главный процесс)

csharp
if (rank == 0)
{
    sw.Start();
    int countA = 10;
    int countB = 1;
    ...
}

    Главный процесс заполняет матрицы A и B значениями, начиная с 10 и 1 соответственно.
    Затем он отправляет данные другим процессам.

Другие процессы

csharp
else
{
    for (int i = 0; i < rowsA; i++)
    {
        ...
    }
}

    Все остальные процессы получают данные из матриц A и B, отправленные главным процессом.

Распределение задач

csharp
int rowsPerProcess = rowsA / size;
int startRow = rank * rowsPerProcess;
int endRow = (rank + 1) * rowsPerProcess;

    Каждому процессу назначается своя часть строк для умножения, что позволяет параллельно вычислять результаты.

Умножение матриц

csharp
for (int i = startRow; i < endRow; i++)
{
    for (int j = 0; j < colsB; j++)
    {
        matrixC[i * colsB + j] = 0;
        for (int k = 0; k < colsA; k++)
        {
            matrixC[i * colsB + j] += matrixA[i * colsA + k] * matrixB[k * colsB + j];
        }
    }
}

Каждый процесс выполняет умножение своей части матрицы A на матрицу B, сохраняя результаты в матрице C.
Сбор результатов
Процесс 0

csharp
if (rank == 0)
{
    for (int i = 1; i < size; i++)
    {
        ...
    }
}

Главный процесс собирает результаты от всех других процессов.
Другие процессы

csharp
else
{
    for (int i = startRow; i < endRow; i++)
    {
        ...
    }
}

Другие процессы отправляют свои результаты главному процессу.
Вывод результата

csharp
if (rank == 0)
{
    Console.WriteLine("Результирующая матрица:");
    ...
}

В конце главный процесс выводит результирующую матрицу на консоль и время выполнения.
