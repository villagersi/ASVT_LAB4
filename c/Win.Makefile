ld=link
cc=cl

cflags=/I "C:\Program Files (x86)\Microsoft SDKs\MPI\Include" /O2
ldflags=/libpath:"C:\Program Files (x86)\Microsoft SDKs\MPI\Lib\x64"

libs=msmpi.lib

outputs=mpi_detect.exe mpi_pi.exe mpi_ping_pong.exe mpi_ring.exe
objs=mpi_detect.obj mpi_pi.obj mpi_ping_pong.obj mpi_ring.obj

all: mpi_detect mpi_pi mpi_ping_pong mpi_ring

mpi_detect: mpi_detect.obj
	$(ld) $(libs) $(ldflags) /machine:x64 /out:mpi_detect.exe mpi_detect.obj

mpi_detect.obj:
	$(cc) $(cflags) /c mpi_detect.c

mpi_pi: mpi_pi.obj
	$(ld) $(libs) $(ldflags) /machine:x64 /out:mpi_pi.exe mpi_pi.obj

mpi_pi.obj:
	$(cc) $(cflags) /c mpi_pi.c

mpi_ping_pong: mpi_ping_pong.obj
	$(ld) $(libs) $(ldflags) /machine:x64 /out:mpi_ping_pong.exe mpi_ping_pong.obj

mpi_ping_pong.obj:
	$(cc) $(cflags) /c mpi_ping_pong.c

mpi_ring: mpi_ring.obj
	$(ld) $(libs) $(ldflags) /machine:x64 /out:mpi_ring.exe mpi_ring.obj

mpi_ring.obj:
	$(cc) $(cflags) /c mpi_ring.c

clean:
	@del /Q $(objs)
	@del /Q $(outputs)