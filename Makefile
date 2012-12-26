OBJ = dgemm_example.o

FFLAGS = -O3 -m64
# LIBS = /usr/local/lib/BLAS/libfblas.a
LIBS = /usr/local/lib/atlas/lib/libptf77blas.a /usr/local/lib/atlas/lib/libatlas.a
# LIBS = /usr/local/lib/atlas/lib/libf77blas.a /usr/local/lib/atlas/lib/libatlas.a

dgemm_example: $(OBJ)
	f77 $(FFLAGS) -o dgemm_example $(OBJ) $(LIBS)

clean:
	-rm *.o
