      PROGRAM   MAIN

      IMPLICIT NONE

      DOUBLE PRECISION ALPHA, BETA
      INTEGER          M, P, N, I, J
      PARAMETER        (M=7000, P=7000, N=7000)
      DOUBLE PRECISION A(M,P), B(P,N), C(M,N)

      PRINT *, "Initializing data for matrix multiplication C=A*B for "
      PRINT 10, " matrix A(",M," x",P, ") and matrix B(", P," x", N, ")"
10    FORMAT(a,I5,a,I5,a,I5,a,I5,a)
      PRINT *, ""
      ALPHA = 1.0 
      BETA = 0.0

      PRINT *, "Intializing matrix data"
      PRINT *, ""
      DO I = 1, M
        DO J = 1, P
          A(I,J) = ((I-1) * M) + (J-1)
        END DO
      END DO

      DO I = 1, P
        DO J = 1, N
          B(I,J) = ((I-1) * P) + (J-1)
        END DO
      END DO

      DO I = 1, M
        DO J = 1, N
          C(I,J) = 0.0
        END DO
      END DO

      PRINT *, "Computing matrix product"
      CALL DGEMM('N','N',M,N,P,ALPHA,A,M,B,P,BETA,C,M)
      PRINT *, "Computations completed."
      PRINT *, ""

      PRINT *, "Top left corner of matrix A:"
      PRINT 20, ((A(I,J), J = 1,MIN(P,6)), I = 1,MIN(M,6))
      PRINT *, ""

      PRINT *, "Top left corner of matrix B:"
      PRINT 20, ((B(I,J),J = 1,MIN(N,6)), I = 1,MIN(P,6))
      PRINT *, ""

 20   FORMAT(6(F12.0,1x))

      PRINT *, "Top left corner of matrix C:"
      PRINT 30, ((C(I,J), J = 1,MIN(N,6)), I = 1,MIN(M,6))
      PRINT *, ""

 30   FORMAT(6(ES12.4,1x))

C     DO I = 1, M
C       DO J = 1, P
C         WRITE(*,*)C(I,J)
C       END DO
C     END DO

      PRINT *, "Example completed."
      STOP 

      END
