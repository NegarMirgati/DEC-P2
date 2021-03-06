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
Va      5  0  DC 0V
Vb      6  0  DC 0V
Vc      7  0  pulse  Vdd  0  1ps  1ps    50ps    100ps

***********Transistor Level Implementation
Mp1   2  7  1  1  pmos    w='6*Lmin'  L=Lmin 
Mp2   3  6  2  2  pmos    w='6*Lmin'  L=Lmin
Mp3   4  5  3  3  pmos    w='6*Lmin'  L=Lmin 
Mn4   4  5  0  0  nmos    w='1*Lmin'   L=Lmin
Mn5   4  6  0  0  nmos    w='1*Lmin'   L=Lmin 
Mn6   4  7  0  0  nmos    w='1*Lmin'   L=Lmin

***************Cap****************************************************
CL 4 0	cl ** Capacitance of output node


*********Type of Analysis***
.tran  0.1ns  20ns 

.MEASURE TRAN t_rise
+ trig V(4) val = '0.1*Vdd'  rise = 1
+ targ V(4) val = '0.9*Vdd'  rise = 1

.MEASURE TRAN t_fall
+ trig V(4) val = '0.9*Vdd'  fall = 1
+ targ V(4) val = '0.1*Vdd'  fall = 1

.MEASURE highest_freq param = '1 /(t_rise + t_fall)'

.op
.END
