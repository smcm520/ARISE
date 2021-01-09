/********************************************************/
/********************************************************/
/* 					MUSE DATA ANALYSIS					*/
/********************************************************/
/********************************************************/

/*********************************************/
/* 				INITIAL SET UP				 */
/*********************************************/

COMMENT Clear all SAS output and log windows; 
dm 'log;clear;output;clear;odsresults;clear';
options mprint nodate pageno=1;
%SYSMSTORECLEAR; 

/*Load Data and format
Change pathway as needed */
LIBNAME muse 'H:\Muse\Data';
%include 'H:\Muse\Format\Format - MUSE.sas';


/**************************************************************/
/*  						LOAD DATA						  */
/**************************************************************/
proc import datafile = 'H:\Muse\Data\FINAL_DATA_2020-03-19.csv'
 out = work.museunformat
 dbms = csv;
run;
proc contents data=work.museunformat;
run;
/*NOTE: The data set work.muse should have 2191 observations and 778 variables.*/


/**********************************************************************************/
/*  			DELETE OBSERVATIONS FLAGGED BY AMELIA AND MADELEINE 			  */
/**********************************************************************************/
data work.musedel;
set work.museunformat;
if PID in (10984730,10987521,11116958,11125062,11128608,11134083,11222976,11411845,11315473,11316846,11316559,77,11413708,11419558,11415179) then delete;
run;
/*NOTE: The data set work.muse should have 2174 observations and 778 variables.*/


/************************************/
/*		REVERSE SCORE ITEMS     	*/
/************************************/
data work.muserev;
set work.musedel;
L07_1_rev=.;
if	L07_1 in (66,77,88,99) then L07_1_rev = L07_1 ;
else L07_1_rev = 3-L07_1;
L08_1_rev =.;
if	L08_1 in (66,77,88,99) then L08_1_rev = L08_1;
else L08_1_rev = 3-L08_1;
L13_1_rev=.;
if	L13_1 in (66,77,88,99) then L13_1_rev = L13_1;
else L13_1_rev = 5-L13_1;
L17_1_rev =.;
if	L17_1 in (66,77,88,99) then L17_1_rev = L17_1;
else L17_1_rev = 5-L17_1;
BI05_1_rev =.;
if	BI05_1 in (66,77,88,99) then BI05_1_rev	= BI05_1;
else BI05_1_rev	= 5-BI05_1;
BI07_1_rev =.;
if	BI07_1 in (66,77,88,99)	then BI07_1_rev	= BI07_1;
else BI07_1_rev = 5-BI07_1;
BI08_1_rev =.;
if	BI08_1 in (66,77,88,99)	then BI08_1_rev = BI08_1;
else BI08_1_rev = 5-BI08_1;
BI09_1_rev =.;
if	BI09_1 in (66,77,88,99)	then BI09_1_rev = BI09_1;
else BI09_1_rev = 5-BI09_1;
BI10_1_rev =.;
if	BI10_1 in (66,77,88,99)	then BI10_1_rev = BI10_1;
else BI10_1_rev = 5-BI10_1;
BI11_1_rev =.;
if	BI11_1 in (66,77,88,99)	then BI11_1_rev = BI11_1;
else BI11_1_rev = 5-BI11_1;
BI12_1_rev =.;
if	BI12_1 in (66,77,88,99) then BI12_1_rev = BI12_1;
else BI12_1_rev = 5-BI12_1;
BI13_1_rev =.;
if	BI13_1 in (66,77,88,99)then BI13_1_rev = BI13_1;
else BI13_1_rev = 5-BI13_1;
BI18_1_rev =.;
if	BI18_1 in (66,77,88,99) then BI18_1_rev = BI18_1;
else BI18_1_rev = 5-BI18_1;
BI19_1_rev =.;
if	BI19_1 in (66,77,88,99) then BI19_1_rev = BI19_1;
else BI19_1_rev = 5-BI19_1;
BI20_1_rev =.;
if	BI20_1 in (66,77,88,99) then BI20_1_rev = BI20_1;
else BI20_1_rev = 5-BI20_1;
S34_1_rev =.;
if	S34_1 in (66,77,88,99) then S34_1_rev = S34_1;
else S34_1_rev = 5-S34_1;
S35_1_rev =.;
if	S35_1 in (66,77,88,99) then S35_1_rev = S35_1;
else S35_1_rev = 5-S35_1;
S36_1_rev =	.;
if	S36_1 in (66,77,88,99) then	S36_1_rev = S36_1;
else S36_1_rev = 5-S36_1;
CC13_1_rev =.;
if	CC13_1 in (66,77,88,99) then CC13_1_rev = CC13_1;
else CC13_1_rev = 5-CC13_1;
CC18_1_rev =.;
if	CC18_1 in (66,77,88,99) then CC18_1_rev = CC18_1;
else CC18_1_rev = 5-CC18_1;
CC19_1_rev =.;
if	CC19_1 in (66,77,88,99) then CC19_1_rev = CC19_1;
else CC19_1_rev = 5-CC19_1;
CC24_1_rev =.;
if	CC24_1 in (66,77,88,99) then CC24_1_rev = CC24_1;
else CC24_1_rev = 5-CC24_1;
F06_1_rev =.;
if	F06_1 in (66,77,88,99) then F06_1_rev = F06_1;
else F06_1_rev = 5-F06_1;
F10_1_rev =.;
if	F10_1 in (66,77,88,99) then	F10_1_rev = F10_1;
else F10_1_rev = 5-F10_1;
F11_1_rev =.;
if	F11_1 in (66,77,88,99) then	F11_1_rev = F11_1;
else F11_1_rev = 5-F11_1;
F12_1_rev =.;
if	F12_1 in (66,77,88,99) then	F12_1_rev = F12_1;
else F12_1_rev = 5-F12_1;
F13_1_rev =.;
if	F13_1 in (66,77,88,99) then	F13_1_rev = F13_1;
else F13_1_rev = 5-F13_1;
F14_1_rev =.;
if	F14_1 in (66,77,88,99) then	F14_1_rev = F14_1;
else F14_1_rev = 5-F14_1;
F17_1_rev =.;
if	F17_1 in (66,77,88,99) then	F17_1_rev = F17_1;
else F17_1_rev = 5-F17_1;
F18_1_rev =.;
if	F18_1 in (66,77,88,99) then	F18_1_rev = F18_1;
else F18_1_rev = 5-F18_1;
F19_1_rev =.;
if	F19_1 in (66,77,88,99) then F19_1_rev = F19_1;
else F19_1_rev = 5-F19_1;
F20_1_rev =.;
if	F20_1 in (66,77,88,99) then F20_1_rev = F20_1;
else F20_1_rev = 5-F20_1;
N14_1_rev =.;
if	N14_1 in (66,77,88,99) then N14_1_rev = N14_1;
else N14_1_rev = 5-N14_1;
N17_1_rev =.;
if	N17_1 in (66,77,88,99) then N17_1_rev = N17_1;
else N17_1_rev = 5-N17_1;
N18_1_rev =.;
if	N18_1 in (66,77,88,99) then N18_1_rev = N18_1;
else N18_1_rev = 5-N18_1;
N22_1_rev =.;
if	N22_1 in (66,77,88,99) then N22_1_rev = N22_1;
else N22_1_rev = 5-N22_1;
N23_1_rev =.;
if	N23_1 in (66,77,88,99) then N23_1_rev = N23_1;
else N23_1_rev = 5-N23_1;
N25_1_rev =.;
if	N25_1 in (66,77,88,99) then	N25_1_rev = N25_1;
else N25_1_rev = 5-N25_1;
N28_1_rev =.;
if	N28_1 in (66,77,88,99) then	N28_1_rev = N28_1;
else N28_1_rev = 5-N28_1;
N29_1_rev =.;
if	N29_1 in (66,77,88,99) then	N29_1_rev = N29_1;
else N29_1_rev = 5-N29_1;
N30_1_rev =.;
if	N30_1 in (66,77,88,99) then	N30_1_rev = N30_1;
else N30_1_rev = 5-N30_1;
N31_1_rev =.;
if	N31_1 in (66,77,88,99) then	N31_1_rev = N31_1;
else N31_1_rev = 5-N31_1;
N34_1_rev =.;
if	N34_1 in (66,77,88,99) then	N34_1_rev = N34_1;
else N34_1_rev = 5-N34_1;
N35_1_rev =.;
if	N35_1 in (66,77,88,99) then	N35_1_rev = N35_1;
else N35_1_rev = 5-N35_1;
N36_1_rev =	.;
if	N36_1 in (66,77,88,99) then	N36_1_rev = N36_1;
else N36_1_rev = 5-N36_1;
N37_1_rev =	.;
if	N37_1 in (66,77,88,99) then	N37_1_rev = N37_1;
else N37_1_rev = 5	-N37_1;
N39_1_rev =	.;
if	N39_1 in (66,77,88,99) then	N39_1_rev = N39_1;
else N39_1_rev = 5-N39_1;
N41_1_rev =	.;
if	N41_1 in (66,77,88,99) then	N41_1_rev = N41_1;
else N41_1_rev = 5-N41_1;
R01_1_rev =	.;
if	R01_1 in (66,77,88,99) then	R01_1_rev = R01_1;
else R01_1_rev = 5-R01_1;
R02_1_rev =	.;
if	R02_1 in (66,77,88,99) then	R02_1_rev = R02_1;
else R02_1_rev = 5-R02_1;
R03_1_rev =.;
if	R03_1 in (66,77,88,99)	then R03_1_rev = R03_1;
else R03_1_rev = 5-R03_1;
R04_1_rev =.;
if	R04_1 in (66,77,88,99)	then R04_1_rev = R04_1;
else R04_1_rev = 5-R04_1;
R05_1_rev =.;
if	R05_1 in (66,77,88,99)	then R05_1_rev = R05_1;
else R05_1_rev = 5-R05_1;
R06_1_rev =.;
if	R06_1 in (66,77,88,99)	then R06_1_rev = R06_1;
else R06_1_rev = 5-R06_1;
R07_1_rev =.;
if	R07_1 in (66,77,88,99)	then R07_1_rev = R07_1;
else R07_1_rev = 5-R07_1;
R08_1_rev =.;
if	R08_1 in (66,77,88,99) then R08_1_rev = R08_1;
else R08_1_rev = 5-R08_1;
R09_1_rev =	.;
if	R09_1 in (66,77,88,99) then R09_1_rev = R09_1;
else R09_1_rev = 5-R09_1;
R10_1_rev =	.;
if	R10_1 in (66,77,88,99) then R10_1_rev = R10_1;
else R10_1_rev = 5-R10_1;
R11_1_rev =	.;
if	R11_1 in (66,77,88,99) then R11_1_rev = R11_1;
else R11_1_rev = 5-R11_1;
R12_1_rev =	.;
if	R12_1 in (66,77,88,99) then R12_1_rev = R12_1;
else R12_1_rev = 5-R12_1;
R13_1_rev =	.;
if	R13_1 in (66,77,88,99) then R13_1_rev = R13_1;
else R13_1_rev = 5-R13_1;
R14_1_rev =	.;
if	R14_1 in (66,77,88,99) then R14_1_rev = R14_1;
else R14_1_rev = 5-R14_1;
R20_1_rev =	.;
if	R20_1 in (66,77,88,99) then R20_1_rev = R20_1;
else R20_1_rev = 5-R20_1;
R22_1_rev =	.;
if	R22_1 in (66,77,88,99) then R22_1_rev = R22_1;
else R22_1_rev = 5-R22_1;
R27_1_rev =	.;
if	R27_1 in (66,77,88,99) then R27_1_rev = R27_1;
else R27_1_rev = 5-R27_1;
R28_1_rev =	.;
if	R28_1 in (66,77,88,99) then R28_1_rev = R28_1;
else R28_1_rev = 5-R28_1;
R29_1_rev =	.;
if	R29_1 in (66,77,88,99) then R29_1_rev = R29_1;
else R29_1_rev =5-R29_1;
run;
/*NOTE: The data set work.muserev should have 2174 observations and 845 variables.*/


/*****************************************/
/*	SPLIT INTO INITIAL AND RE-TEST DATA	 */
/*****************************************/
* Initial data;
data work.muset1;
set work.muserev;
if SCR04=1;
run;
/*NOTE: The data set work.muset1 should have 2020 observations and 845 variables.*/

* Retest data;
data work.muset2;
set work.muserev;
if SCR04=2;
run;
/*NOTE: The data set work.muset2 should have 154 observations and 845 variables.*/


/*************************************************************/
/*	SPLIT INITIAL, UNFORMATTED DATA INTO EFA/CFA DATA SETS	 */
/*************************************************************/
* Random 50/50 split;
proc surveyselect data=work.muset1 out=work.muset1SPLIT method=srs samprate=0.50 
outall seed=35619 noprint; 
samplingunit PID; 
run;

* Define EFA data and save to perm. library as SAS file and excel file;
data work.muset1EFA;
set muset1SPLIT;
if Selected =0;
run;
data muse.EFA;
set work.muset1EFA;
run;
proc export data=muse.EFA dbms=csv outfile="H:\Muse\Data\museEFA.csv"; 
run;
/*NOTE: The data set muse.muset1EFA should have 1011 observations and 846 variables.*/

* Define CFA data and save to perm. library as SAS file and excel file;
data work.muset1CFA;
set muset1SPLIT;
if Selected =1;
run;
data muse.CFA;
set work.muset1CFA;
run;
proc export data=muse.CFA dbms=csv outfile="H:\Muse\Data\museCFA.csv"; 
run;
/*NOTE: The data set muse.muset1CFA should have 1009 observations and 846 variables.*/
