** Digital Electronic Circuits - CA2

************ Library *************
.prot
.inc '45nm.pm'
.unprot
********* vectors ********
.vec 'VectorTest.txt'
********* Params*******
.param  Lmin = 45n
+Vdd = 1V
+cl = 0ff
+slp = 0.1p
+Out_T_DLY = 12.95
+PRD = 11.37

.global  Vdd
.temp  25
*****************Source Voltages********** 
V       1  0  DC  1V
***Va      5  0  DC  0V
***Vb      6  0  DC  0V
***Vc      7  0  DC  0V
***********Transistor Level Implementation
Mp1   2  7  1  1  pmos    w='6*Lmin'  L=Lmin 
Mp2   3  6  2  2  pmos    w='6*Lmin'  L=Lmin
Mp3   4  5  3  3  pmos    w='6*Lmin'  L=Lmin 
Mn4   4  5  0  0  nmos    w='1*Lmin'   L=Lmin
Mn5   4  6  0  0  nmos    w='1*Lmin'   L=Lmin 
Mn6   4  7  0  0  nmos    w='1*Lmin'   L=Lmin
***************Cap****************************************************
CL 4 0	cl 
*** Capacitance of output node

*********Type of Analysis***
.tran  0.1ns  20ns 

.MEASURE TRAN tpdr
 + trig V(7) val = '0.5 * Vdd'  fall = 1
 + targ V(4)  val = '0.5 * Vdd' rise = 1

.MEASURE TRAN tpdf 
+ trig V(7) val = '0.5 * Vdd' rise = 1
+ targ V(4) val = '0.5 * Vdd' fall = 1

.MEASURE TRAN tpd  param = '0.5 * (tpdr + tpdf)'

.MEASURE TRAN AVGpower avg Power
.MEASURE TRAN PDP param = 'tpd * avgpower'
.op
.END
