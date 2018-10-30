** Digital Electronic Circuits - CA2

************ Library *************
.prot
.inc '45nm.pm'
.unprot
********* Params*******
.param  Lmin=45n
+Vdd=  1V
+cl =	0ff

.global  Vdd
.temp  25

*****************Source Voltages********** 
V       1  0  DC  Vdd
Va      5  0  pulse  Vdd  0  1ps  1ps    50ps    100ps
Vb      6  0  DC  0V
Vc      7  0  DC  0V

***********Transistor Level Implementation
Mp1   2  7  1  1  pmos    w='12*Lmin'  L=Lmin 
Mp2   3  6  2  2  pmos    w='12*Lmin'  L=Lmin
Mp3   4  5  3  3  pmos    w='12*Lmin'  L=Lmin 
Mn4   4  5  0  0  nmos    w='2*Lmin'   L=Lmin
Mn5   4  6  0  0  nmos    w='2*Lmin'   L=Lmin 
Mn6   4  7  0  0  nmos    w='2*Lmin'   L=Lmin

***************Cap****************************************************
CL out 0	cl ** Capacitance of output node


*********Type of Analysis***
.tran 1p 200n 1p

.MEASURE TRAN t_rise
+ trig V(4) val = '0.1*Vdd'  rise = 1
+ targ V(4) val = '0.9*Vdd'  rise = 1

.MEASURE TRAN t_fall
+ trig V(4) val = '0.9*Vdd'  fall = 1
+ targ V(4) val = '0.1*Vdd'  fall = 1

.MEASURE TRAN tpdr
 
 + trig V(5) val = '0.5 * Vdd' fall = 1
 + targ V(4)  val = '0.5 * Vdd' rise = 1

.MEASURE TRAN tpdf 
+ trig V(5) val = '0.5 * Vdd' rise = 1
+ targ V(4) val = '0.5 * Vdd' fall = 1

.MEASURE TRAN tpd  param = '0.5 * (tpdr + tpdf)'





.op
.END
