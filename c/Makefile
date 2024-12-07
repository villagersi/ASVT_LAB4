CC=mpicc

mpidetect: mpi_detect
	$(CC) mpi_detect.c -o mpi_detect

mpipi: mpi_pi
	$(CC) mpi_pi.c -o mpi_pi

run: mpidetect
	./mpi_detect
