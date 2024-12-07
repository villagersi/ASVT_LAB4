##

Учебники:

https://mpitutorial.com/tutorials/mpi-send-and-receive/

## Установка на Linux

Установить пакет `openmpi`

Компилятор и заголовочные файлы в пути:

* `/usr/lib64/openmpi/include`
* `/usr/lib64/openmpi/bin`

### Компиляция на Linux:

```sh
mpicc <source.c> -o <source_bin>
```

Запуск:

```sh
mpiexec -n X ./source_bin
```

## Примеры алгоритмов

Вычисление PI: https://github.com/kiwenlau/MPI_PI
Алгоритм Монте-Карло: https://habr.com/ru/articles/128454/


## Установка на Windows

Установка SDK: https://learn.microsoft.com/en-us/message-passing-interface/microsoft-mpi

Скачать тут: 
https://github.com/microsoft/Microsoft-MPI/releases/tag/v10.1.1
https://www.microsoft.com/en-us/download/details.aspx?id=105289


Документация: https://github.com/microsoft/Microsoft-MPI/blob/master/examples/helloworld/Run_MPIHelloWorld.md

https://learn.microsoft.com/ru-ru/archive/blogs/windowshpc/how-to-compile-and-run-a-simple-ms-mpi-program

Проверка переменных окружения:

```cmd
set MSMPI
MSMPI_BENCHMARKS=C:\Program Files\Microsoft MPI\Benchmarks\
MSMPI_BIN=C:\Program Files\Microsoft MPI\Bin\
MSMPI_INC=C:\Program Files (x86)\Microsoft SDKs\MPI\Include\
MSMPI_LIB32=C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x86\
MSMPI_LIB64=C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x64\
```

### Компиляция на Windows:

Запуск консоли Visual Studio Developer Tools

Компиляция C исходников:
cl /I "C:\Program Files (x86)\Microsoft SDKs\MPI\Include" /c <source.c>

Линкер:
link /machine:x86 /out:mpi_detect.exe "msmpi.lib" /libpath:"C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x86" mpi_detect.obj

Запуск:

```cmd
mpiexec -n X ./source_bin.exe
```