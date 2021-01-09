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


/**********************************************************************************/
/*      CHANGE NEIGHBORHOOD IDs AND PIDs AS FLAGGED BY AMELIA AND MADELEINE 	  */
/**********************************************************************************/
data work.museadj;
set work.musedel;
*create vars with all original PID and neighborhood ID for internal records/consistency;
PID_original=PID;
NBHDID_T1_orig=SCR03;
NBHDID_T2_orig=SCR05b;
if	PID=10981165	then	PID=11111165;			
if	PID=10981165	then	SCR03=111;			
if	PID=10982955	then	PID=11122955;			
if	PID=10982955	then	SCR03=112;			
if	PID=10983441	then	PID=11113441;			
if	PID=10983441	then	SCR03=111;			
if	PID=10983921	then	PID=11113921;			
if	PID=10983921	then	SCR03=111;			
if	PID=10984040	then	PID=11114040;			
if	PID=10984040	then	SCR03=111;			
if	PID=10986282	then	PID=11126282;			
if	PID=10986282	then	SCR03=112;			
if	PID=11052253	then	PID=11422253;			
if	PID=11052253	then	SCR03=142;			
if	PID=11058963	then	PID=11528963;			
if	PID=11058963	then	SCR03=152;			
if	PID=11059674	then	PID=11419674;			
if	PID=11059674	then	SCR03=141;			
if	PID=11063628	then	PID=11343628;			
if	PID=11063628	then	SCR03=134;			
if	PID=11141405	then	PID=11211405;			
if	PID=11141405	then	SCR03=121;			
if	PID=11141405	then	SCR05b=11211405;			
if	PID=11141437	then	PID=11211437;			
if	PID=11141437	then	SCR03=121;			
if	PID=11141437	then	SCR05b=11211437;			
if	PID=11141524	then	PID=11211524;			
if	PID=11141524	then	SCR03=121;			
if	PID=11147234	then	PID=11217234;			
if	PID=11147234	then	SCR03=121;			
if	PID=11147234	then	SCR05b=11217234;				
if	PID=11149445	then	PID=11219445;			
if	PID=11149445	then	SCR03=121;			
if	PID=11149576	then	PID=11219576;			
if	PID=11149576	then	SCR03=121;			
if	PID=11235273	then	PID=11245273;			
if	PID=11235273	then	SCR03=124;			
if	PID=11314019	then	PID=11344019;			
if	PID=11314019	then	SCR03=134;			
if	PID=11414841 	then	PID=11524841;			
if	PID=11414841	then	SCR03=152;			
if	PID=11417191	then	PID=11527191;			
if	PID=11417191	then	SCR03=152;			
if	PID=11443892	then	PID=11413892;			
if	PID=11443892	then	SCR03=141;			
if	PID=11525155	then	PID=11515155;			
if	PID=11525155	then	SCR03=151;			
if	PID=11227502	then	SCR05b=11222347;			
if	PID=22068850	then	PID=22018850;			
if	PID=22068850	then	SCR03=201;			
if	PID=22065861	then	PID=22315861;			
if	PID=22065861	then	SCR03=231;			
if	PID=22085791	then	PID=22325791;			
if	PID=22085791	then	SCR03=232;			
if	PID=22318314	then	PID=22308314;			
if	PID=22318314	then	SCR03=230;			
if	PID=22319610	then	PID=22309610;			
if	PID=22319610	then	SCR03=230;			
if	PID=22319610	then	PID=22309610;			
if	PID=22319610	then	SCR03=230;			
if	PID=22318535	then	PID=22358535;			
if	PID=22318535	then	SCR03=235;			
if	PID=22317207	then	PID=22337207;			
if	PID=22317207	then	SCR03=233;			
if	PID=22313166	then	PID=22333166;			
if	PID=22313166	then	SCR03=233;			
if	PID=22319908	then	PID=22339908;			
if	PID=22319908	then	SCR03=233;			
if	PID=22311238	then	PID=22331238;			
if	PID=22311238	then	SCR03=233;			
if	PID=22313117	then	PID=22333117;			
if	PID=22313117	then	SCR03=233;			
if	PID=22314169	then	PID=22334169;			
if	PID=22314169	then	SCR03=233;			
if	PID=22318493	then	PID=22338493;			
if	PID=22318493	then	SCR03=233;			
if	PID=22318099	then	PID=22338099;			
if	PID=22318099	then	SCR03=233;			
if	PID=22316818	then	PID=22336818;			
if	PID=22316818	then	SCR03=233;			
if	PID=22319668	then	PID=22339668;			
if	PID=22319668	then	SCR03=233;			
if	PID=22315541	then	PID=22335541;			
if	PID=22315541	then	SCR03=233;			
if	PID=22315721	then	PID=22335721;			
if	PID=22315721	then	SCR03=233;			
if	PID=22316144	then	PID=22336144;			
if	PID=22316144	then	SCR03=233;			
if	PID=22312103	then	PID=22332103;			
if	PID=22312103	then	SCR03=233;			
if	PID=22318225	then	PID=22338225;			
if	PID=22318225	then	SCR03=233;			
if	PID=22313132	then	PID=22333132;			
if	PID=22313132	then	SCR03=233;			
if	PID=22314962	then	PID=22334962;			
if	PID=22314962	then	SCR03=233;			
if	PID=22313376	then	PID=22333376;			
if	PID=22313376	then	SCR03=233;			
if	PID=22319897	then	PID=22339897;			
if	PID=22319897	then	SCR03=233;			
if	PID=22316278	then	PID=22336278;			
if	PID=22316278	then	SCR03=233;			
if	PID=22311850	then	PID=22331850;			
if	PID=22311850	then	SCR03=23;			
if	PID=22314227	then	PID=2233422;			
if	PID=22314227	then	SCR03=233;			
if	PID=22317403	then	PID=22337403;			
if	PID=22317403	then	SCR03=233;			
if	PID=22318689	then	PID=22338689;			
if	PID=22318689	then	SCR03=233;			
if	PID=22316615	then	PID=22336615;			
if	PID=22316615	then	SCR03=233;			
if	PID=22319456	then	PID=22339456;			
if	PID=22319456	then	SCR03=233;			
if	PID=22315281	then	PID=22335281;			
if	PID=22315281	then	SCR03=233;			
if	PID=22312932	then	PID=22332932;			
if	PID=22312932	then	SCR03=233;			
if	PID=22312389	then	PID=22332389;			
if	PID=22312389	then	SCR03=233;			
if	PID=22313693	then	PID=22333693;			
if	PID=22313693	then	SCR03=233;			
if	PID=22315522	then	PID=22335522;			
if	PID=22315522	then	SCR03=233;			
if	PID=22317660	then	PID=22337660;			
if	PID=22317660	then	SCR03=233;			
if	PID=22317210	then	PID=22337210;			
if	PID=22317210	then	SCR03=233;			
if	PID=22319382	then	PID=22339382;			
if	PID=22319382	then	SCR03=233;			
if	PID=22319533	then	PID=22339533;			
if	PID=22319533	then	SCR03=233;			
if	PID=22467435	then	PID=22477435;			
if	PID=22467435	then	SCR03=247;			
if	PID=22486315	then	PID=22356315;			
if	PID=22486315	then	SCR03=235;			
if	PID=22012019	then	PID=22122019;			
if	PID=22012019	then	SCR03=212;			
if	PID=22012025	then	PID=22122025;			
if	PID=22012025	then	SCR03=212;			
if	PID=22014347	then	PID=22124347;			
if	PID=22014347	then	SCR03=212;			
if	PID=22013545	then	PID=22123545;			
if	PID=22013545	then	SCR03=212;			
if	PID=22012489	then	PID=22122489;			
if	PID=22012489	then	SCR03=212;			
if	PID=22016336	then	PID=22126336;			
if	PID=22016336	then	SCR03=212;			
if	PID=22012744	then	PID=22122744;			
if	PID=22012744	then	SCR03=212;			
if	PID=22015944	then	PID=22215944;			
if	PID=22015944	then	SCR03=221;			
if	PID=22016268	then	PID=22216268;			
if	PID=22016268	then	SCR03=221;			
if	PID=22018859	then	PID=22218859;			
if	PID=22018859	then	SCR03=221;			
if	PID=22125377	then	PID=22015377;			
if	PID=22125377	then	SCR03=201;		
if	PID=22125563	then	PID=22015563;			
if	PID=22125563	then	SCR03=201;			
if	PID=22124667	then	PID=22014667;			
if	PID=22124667	then	SCR03=201;			
if	PID=22126868	then	PID=22166868;			
if	PID=22126868	then	SCR03=216;
if	PID=11314725 and SCR01=114	then	PID=11334725;
if	PID=11314725 and SCR01=114	then	SCR03=133;	
run;
/*NOTE: The data set work.muse should have 2174 observations and 781 variables.*/

/*****************************************************/
/*  				 FORMAT DATA				     */
/*****************************************************/
data work.museformat;
set work.museadj;
		format	SCR02	fcountry.	;
		format	SCR04	fyn.	;
		format	SCR06	fyn.	;
		format	SCR07I	fyn.	;
		format	SCR07U	fluganda.	;
		format	SCR08	fyn.	;
		format	SCR09	fyn.	;
		format	SCR10	fyn.	;
		format	SCR11	fyn.	;
		format	D02	fyn.	;
		format	D03	feducation.	;
		format	D03noschool	fnoschool.	;
		format	D04	ffrequency.	;
		format	D05	ffrequency.	;
		format	D06	ffrequency.	;
		format	D07	fyn.	;
		format	D08	fincome.	;
		format	D10	fmaritalstatus.	;
		format	D13_1	ftf.	;
		format	D13_2	ftf.	;
		format	D13_3	ftf.	;
		format	D13_4	ftf.	;
		format	D13_5	ftf.	;
		format	D13_6	ftf.	;
		format	D13_7	ftf.	;
		format	D13_8	ftf.	;
		format	D13_9	ftf.	;
		format	D13_10	ftf.	;
		format	D13_99	ftf.	;
		format	D13_88	ftf.	;
		format	D13_77	ftf.	;
		format	D13_66	ftf.	;
		format	D14_1	ftf.	;
		format	D14_2	ftf.	;
		format	D14_3	ftf.	;
		format	D14_4	ftf.	;
		format	D14_5	ftf.	;
		format	D14_6	ftf.	;
		format	D14_7	ftf.	;
		format	D14_8	ftf.	;
		format	D14_9	ftf.	;
		format	D14_10	ftf.	;
		format	D14_11	ftf.	;
		format	D14_12	ftf.	;
		format	D14_13	ftf.	;
		format	D14_14	ftf.	;
		format	D14_15	ftf.	;
		format	D14_16	ftf.	;
		format	D14_17	ftf.	;
		format	D14_18	ftf.	;
		format	D14_19	ftf.	;
		format	D14_88	ftf.	;
		format	D14_77	ftf.	;
		format	D14_66	ftf.	;
		format	D15	fyn.	;
		format	D16	freligion.	;
		format	D17I	fcaste.	;
		format	D17U	fethnicgroup.	;
		format	D18	fbirthplace.	;
		format	D21	flikelylikert.	;
		format	D22I_1	ftf.	;
		format	D22I_2	ftf.	;
		format	D22I_3	ftf.	;
		format	D22I_4	ftf.	;
		format	D22I_5	ftf.	;
		format	D22I_6	ftf.	;
		format	D22I_7	ftf.	;
		format	D22I_8	ftf.	;
		format	D22I_9	ftf.	;
		format	D22I_10	ftf.	;
		format	D22I_11	ftf.	;
		format	D22I_12	ftf.	;
		format	D22I_13	ftf.	;
		format	D22I_14	ftf.	;
		format	D22I_15	ftf.	;
		format	D22I_16	ftf.	;
		format	D22I_17	ftf.	;
		format	D22I_18	ftf.	;
		format	D22I_19	ftf.	;
		format	D22I_20	ftf.	;
		format	D22I_21	ftf.	;
		format	D22I_88	ftf.	;
		format	D22I_77	ftf.	;
		format	D22I_66	ftf.	;
		format	D22U_1	ftf.	;
		format	D22U_2	ftf.	;
		format	D22U_3	ftf.	;
		format	D22U_4	ftf.	;
		format	D22U_5	ftf.	;
		format	D22U_6	ftf.	;
		format	D22U_7	ftf.	;
		format	D22U_8	ftf.	;
		format	D22U_9	ftf.	;
		format	D22U_10	ftf.	;
		format	D22U_11	ftf.	;
		format	D22U_12	ftf.	;
		format	D22U_13	ftf.	;
		format	D22U_14	ftf.	;
		format	D22U_15	ftf.	;
		format	D22U_16	ftf.	;
		format	D22U_17	ftf.	;
		format	D22U_88	ftf.	;
		format	D22U_77	ftf.	;
		format	D22U_66	ftf.	;
		format	D23I_1	ftf.	;
		format	D23I_2	ftf.	;
		format	D23I_3	ftf.	;
		format	D23I_4	ftf.	;
		format	D23I_5	ftf.	;
		format	D23I_6	ftf.	;
		format	D23I_7	ftf.	;
		format	D23I_88	ftf.	;
		format	D23I_77	ftf.	;
		format	D23I_66	ftf.	;
		format	D23U_1	ftf.	;
		format	D23U_2	ftf.	;
		format	D23U_3	ftf.	;
		format	D23U_4	ftf.	;
		format	D23U_5	ftf.	;
		format	D23U_6	ftf.	;
		format	D23U_7	ftf.	;
		format	D23U_88	ftf.	;
		format	D23U_77	ftf.	;
		format	D23U_66	ftf.	;
		format	D24I_1	ftf.	;
		format	D24I_2	ftf.	;
		format	D24I_3	ftf.	;
		format	D24I_88	ftf.	;
		format	D24I_77	ftf.	;
		format	D24I_66	ftf.	;
		format	D24U_1	ftf.	;
		format	D24U_2	ftf.	;
		format	D24U_3	ftf.	;
		format	D24U_88	ftf.	;
		format	D24U_77	ftf.	;
		format	D24U_66	ftf.	;
		format	SD01	fsanlocation.	;
		format	SD01a	fsantype.	;
		format	SD02	fshareyn.	;
		format	SD03	fshare.	;
		format	SU01	fyn.	;
		format	SU02	fsanlocation.	;
		format	SU02a	fsantype.	;
		format	SU03	fshareyn.	;
		format	SU04	fshare.	;
		format	SU20	fyn.	;
		format	SU21	fsantype.	;
		format	SD19	fyn.	;
		format	SD20	fsantype.	;
		format	MC01	fmenstruate.	;
		format	MH02	fmenmat.	;
		format	MH03	fmenchange.	;
		format	MH04	fmenchange.	;
		format	MH05	fmendisp.	;
		format	DM06_1	fyn.	;
		format	DM05_1	fyn.	;
		format	DM04_1	fyn.	;
		format	DM03_1	fyn.	;
		format	DM02_1	fyn.	;
		format	DM01_1	fyn.	;
		format	DM18_1	fyn.	;
		format	DM17_1	fyn.	;
		format	DM16_1	fyn.	;
		format	DM15_1	fyn.	;
		format	DM14_1	fyn.	;
		format	DM13_1	fyn.	;
		format	DM12_1	fyn.	;
		format	DM11_1	fyn.	;
		format	DM10_1	fyn.	;
		format	DM09_1	fyn.	;
		format	DM08_1	fyn.	;
		format	DM23_1	fagreelikert.	;
		format	DM24_1	fagreelikert.	;
		format	DM25_1	fagreelikert.	;
		format	DM26_1	fagreelikert.	;
		format	DM27_1	fagreelikert.	;
		format	DM28_1	fagreelikert.	;
		format	DM29_1	fagreelikert.	;
		format	DM30_1	fagreelikert.	;
		format	DM31_1	fagreelikert.	;
		format	DM35_1	fagreelikert.	;
		format	DM36_1	fagreelikert.	;
		format	DM37_1	fagreelikert.	;
		format	DM38_1	fagreelikert.	;
		format	DM39_1	fagreelikert.	;
		format	DM40_1	fagreelikert.	;
		format	DM41_1	fagreelikert.	;
		format	DM42_1	fagreelikert.	;
		format	DM43_1	fagreelikert.	;
		format	DM44_1	fagreelikert.	;
		format	DM45_1	fagreelikert.	;
		format	DM46_1	fagreelikert.	;
		format	DM47_1	fagreelikert.	;
		format	DM48_1	fagreelikert.	;
		format	DM49_1	fagreelikert.	;
		format	DM51_1	fagreelikert.	;
		format	DM52_1	fagreelikert.	;
		format	DM53_1	fagreelikert.	;
		format	L01_1	fyn.	;
		format  L02_1_1 ftf.	;
		format  L02_1_2	ftf.	;
		format  L02_1_3	ftf.	;
		format  L02_1_4	ftf.	;
		format  L02_1_5	ftf.	;
		format  L02_1_6	ftf.	;
		format  L02_1_99 ftf.	;
		format  L02_1_88 ftf.	;
		format  L02_1_77 ftf.	;
		format  L02_1_66 ftf.	;
		format	L03_1	fgroupmembers.	;
		format	L04_1	fyn.	;
		format	L05_1	fyn.	;
		format	L06_1	fyn.	;
		format	L07_1	fyn.	;
		format	L08_1	fyn.	;
		format	L09_1	fyn.	;
		format	L10_1	fyn.	;
		format	L11_1	fyn.	;
		format	L12_1	fyn.	;
		format	L13_1	fagreelikert.	;
		format	L14_1	fagreelikert.	;
		format	L15_1	fagreelikert.	;
		format	L16_1	fagreelikert.	;
		format	L17_1	fagreelikert.	;
		format	L18_1	fagreelikert.	;
		format	L19_1	fagreelikert.	;
		format	L20_1	fagreelikert.	;
		format	L21_1	fagreelikert.	;
		format	CA01_1	fyn.	;
		format	CA01a_1	fgroupmembers.	;
		format	CA02_1	fyn.	;
		format	CA02a_1	fgroupmembers.	;
		format	CA03_1	fyn.	;
		format	CA03a_1	fgroupmembers.	;
		format	CA04_1	fyn.	;
		format	CA04a_1	fgroupmembers.	;
		format	CA05_1	fyn.	;
		format	CA05a_1	fgroupmembers.	;
		format	CA06_1	fyn.	;
		format	CA06a_1	fgroupmembers.	;
		format	CA07_1	fyn.	;
		format	CA07a_1	fgroupmembers.	;
		format	CA08_1	fyn.	;
		format	CA08a_1	fgroupmembers.	;
		format	CA09_1	fyn.	;
		format	CA09a_1	fgroupmembers.	;
		format	CA10_1	fyn.	;
		format	CA10a_1	fgroupmembers.	;
		format	CA11_1	fyn.	;
		format	CA11a_1	fyn.	;
		format	CA12_1	fagreelikert.	;
		format	CA14_1	fagreelikert.	;
		format	CA15_1	fagreelikert.	;
		format	CA16_1	fagreelikert.	;
		format	CA17_1	fagreelikert.	;
		format	CA18_1	fagreelikert.	;
		format	CA19_1	fagreelikert.	;
		format	CA21_1	fagreelikert.	;
		format	CA22_1	fagreelikert.	;
		format	CA23_1	fagreelikert.	;
		format	CA24_1	fagreelikert.	;
		format	M01_1	fmobility.	;
		format	M02_1	fmobility.	;
		format	M03_1	fmobility.	;
		format	M04_1	fmobility.	;
		format	M05_1	fmobility.	;
		format	M06_1	fmobility.	;
		format	M07_1	fyn.	;
		format	M08_1	fyn.	;
		format	M09_1	fyn.	;
		format	M10_1	fyn.	;
		format	M11_1	fyn.	;
		format	M12_1	fyn.	;
		format	M13_1	fmobility.	;
		format	M14_1	fmobility.	;
		format	M15_1	fmobility.	;
		format	M16_1	fmobility.	;
		format	M17_1	fyn.	;
		format	M18_1	fyn.	;
		format	M19_1	fyn.	;
		format	M20_1	fyn.	;
		format	M21_1	fyn.	;
		format	M22_1	fyn.	;
		format	BI01_1	ffreqlikert.	;
		format	BI02_1	ffreqlikert.	;
		format	BI03_1	ffreqlikert.	;
		format	BI04_1	ffreqlikert.	;
		format	BI05_1	ffreqlikert.	;
		format	BI06_1	ffreqlikert.	;
		format	BI07_1	ffreqlikert.	;
		format	BI08_1	ffreqlikert.	;
		format	BI09_1	ffreqlikert.	;
		format	BI10_1	ffreqlikert.	;
		format	BI11_1	ffreqlikert.	;
		format	BI12_1	ffreqlikert.	;
		format	BI13_1	ffreqlikert.	;
		format	BI14_1	ffreqlikert.	;
		format	BI15_1	ffreqlikert.	;
		format	BI16_1	ffreqlikert.	;
		format	BI17_1	ffreqlikert.	;
		format	BI18_1	ffreqlikert.	;
		format	BI19_1	ffreqlikert.	;
		format	BI20_1	ffreqlikert.	;
		format	H01_1	ffreqlikert.	;
		format	H02_1	ffreqlikert.	;
		format	H03_1	ffreqlikert.	;
		format	H04_1	ffreqlikert.	;
		format	H05_1	ffreqlikert.	;
		format	H06_1	ffreqlikert.	;
		format	H07_1	ffreqlikert.	;
		format	H08_1	ffreqlikert.	;
		format	H09_1	ffreqlikert.	;
		format	H10_1	ffreqlikert.	;
		format	H11_1	ffreqlikert.	;
		format	H12_1	ffreqlikert.	;
		format	H13_1	ffreqlikert.	;
		format	H14_1	ffreqlikert.	;
		format	H15_1	ffreqlikert.	;
		format	H16_1	ffreqlikert.	;
		format	H17_1	ffreqlikert.	;
		format	H18_1	ffreqlikert.	;
		format	H19_1	ffreqlikert.	;
		format	H20_1	ffreqlikert.	;
		format	H22_1	ffreqlikert.	;
		format	H23_1	ffreqlikert.	;
		format	H24_1	ffreqlikert.	;
		format	S01_1	fagreelikert.	;
		format	S02_1	fagreelikert.	;
		format	S03_1	fagreelikert.	;
		format	S08_1	fagreelikert.	;
		format	S09_1	fagreelikert.	;
		format	S10_1	fagreelikert.	;
		format	S11_1	fagreelikert.	;
		format	S12_1	fagreelikert.	;
		format	S13_1	fagreelikert.	;
		format	S14_1	fagreelikert.	;
		format	S15_1	fagreelikert.	;
		format	S04_1	fagreelikert.	;
		format	S05_1	fagreelikert.	;
		format	S06_1	fagreelikert.	;
		format	S07_1	fagreelikert.	;
		format	S16_1	fagreelikert.	;
		format	S17_1	fagreelikert.	;
		format	S18_1	fagreelikert.	;
		format	S19_1	fagreelikert.	;
		format	S20_1	fagreelikert.	;
		format	S21_1	fagreelikert.	;
		format	S22_1	fagreelikert.	;
		format	S23_1	fagreelikert.	;
		format	S24_1	fagreelikert.	;
		format	S25_1	fagreelikert.	;
		format	S26_1	fagreelikert.	;
		format	S27_1	fagreelikert.	;
		format	S28_1	fagreelikert.	;
		format	S29_1	fagreelikert.	;
		format	S30_1	fagreelikert.	;
		format	S31_1	fagreelikert.	;
		format	S32_1	fagreelikert.	;
		format	S33_1	fagreelikert.	;
		format	S34_1	fagreelikert.	;
		format	S35_1	fagreelikert.	;
		format	S36_1	fagreelikert.	;
		format	S37_1	fagreelikert.	;
		format	P01_1	fagreelikert.	;
		format	P02_1	fagreelikert.	;
		format	P03_1	fagreelikert.	;
		format	P04_1	fagreelikert.	;
		format	P05_1	fagreelikert.	;
		format	P06_1	fagreelikert.	;
		format	P07_1	fagreelikert.	;
		format	P08_1	fagreelikert.	;
		format	P09_1	fagreelikert.	;
		format	P10_1	fagreelikert.	;
		format	P11_1	fagreelikert.	;
		format	P12_1	fagreelikert.	;
		format	CC01_1	fagreelikert.	;
		format	CC02_1	fagreelikert.	;
		format	CC03_1	fagreelikert.	;
		format	CC04_1	fagreelikert.	;
		format	CC05_1	fagreelikert.	;
		format	CC06_1	fagreelikert.	;
		format	CC07_1	fagreelikert.	;
		format	CC08_1	fagreelikert.	;
		format	CC09_1	fagreelikert.	;
		format	CC10_1	fagreelikert.	;
		format	CC11_1	fagreelikert.	;
		format	CC12_1	fagreelikert.	;
		format	CC13_1	fagreelikert.	;
		format	CC14_1	fagreelikert.	;
		format	CC15_1	fagreelikert.	;
		format	CC16_1	fagreelikert.	;
		format	CC17_1	fagreelikert.	;
		format	CC18_1	fagreelikert.	;
		format	CC19_1	fagreelikert.	;
		format	CC20_1	fagreelikert.	;
		format	CC21_1	fagreelikert.	;
		format	CC23_1	fagreelikert.	;
		format	CC24_1	fagreelikert.	;
		format	F02_1	fagreelikert.	;
		format	F01_1	fagreelikert.	;
		format	F03_1	fagreelikert.	;
		format	F04_1	fagreelikert.	;
		format	F05_1	fagreelikert.	;
		format	F06_1	fagreelikert.	;
		format	F07_1	fagreelikert.	;
		format	F08_1	fagreelikert.	;
		format	F10_1	fagreelikert.	;
		format	F11_1	fagreelikert.	;
		format	F12_1	fagreelikert.	;
		format	F13_1	fagreelikert.	;
		format	F14_1	fagreelikert.	;
		format	F15_1	fagreelikert.	;
		format	F16_1	fagreelikert.	;
		format	F17_1	fagreelikert.	;
		format	F18_1	fagreelikert.	;
		format	F19_1	fagreelikert.	;
		format	F20_1	fagreelikert.	;
		format	T01_1	fagreelikert.	;
		format	T02_1	fagreelikert.	;
		format	T03_1	fagreelikert.	;
		format	T04_1	fagreelikert.	;
		format	T05_1	fagreelikert.	;
		format	T06_1	fagreelikert.	;
		format	T07_1	fagreelikert.	;
		format	T08_1	fagreelikert.	;
		format	T09_1	fagreelikert.	;
		format	T10_1	fagreelikert.	;
		format	T11_1	fagreelikert.	;
		format	SC01_1	fagreelikert.	;
		format	SC02_1	fagreelikert.	;
		format	SC03_1	fagreelikert.	;
		format	SC04_1	fagreelikert.	;
		format	SC05_1	fagreelikert.	;
		format	SC06_1	fagreelikert.	;
		format	SC07_1	fagreelikert.	;
		format	SC08_1	fagreelikert.	;
		format	SC09_1	fagreelikert.	;
		format	SC10_1	fagreelikert.	;
		format	SC11_1	fagreelikert.	;
		format	SC12_1	fagreelikert.	;
		format	SC13_1	fagreelikert.	;
		format	SC14_1	fagreelikert.	;
		format	SC15_1	fagreelikert.	;
		format	SC16_1	fagreelikert.	;
		format	SC17_1	fagreelikert.	;
		format	SC18_1	fagreelikert.	;
		format	SC19_1	fagreelikert.	;
		format	K01_1	fagreelikert.	;
		format	K02_1	fagreelikert.	;
		format	K03_1	fagreelikert.	;
		format	K04_1	fagreelikert.	;
		format	K05_1	fagreelikert.	;
		format	K06_1	fagreelikert.	;
		format	K07_1	fagreelikert.	;
		format	K08_1	fagreelikert.	;
		format	K09_1	fagreelikert.	;
		format	K10_1	fagreelikert.	;
		format	K12_1	fagreelikert.	;
		format	K13_1	fagreelikert.	;
		format	K14_1	fagreelikert.	;
		format	K15_1	fagreelikert.	;
		format	K16_1	fagreelikert.	;
		format	K17_1	fagreelikert.	;
		format	K18_1	fagreelikert.	;
		format	K19_1	fagreelikert.	;
		format	K20_1	fagreelikert.	;
		format	K21_1	fagreelikert.	;
		format	N01_1	fagreelikert.	;
		format	N03_1	fagreelikert.	;
		format	N05_1	fagreelikert.	;
		format	N07_1	fagreelikert.	;
		format	N09_1	fagreelikert.	;
		format	N11_1	fagreelikert.	;
		format	N13_1	fagreelikert.	;
		format	N14_1	fagreelikert.	;
		format	N15_1	fagreelikert.	;
		format	N16_1	fagreelikert.	;
		format	N17_1	fagreelikert.	;
		format	N18_1	fagreelikert.	;
		format	N19_1	fagreelikert.	;
		format	N20_1	fagreelikert.	;
		format	N21_1	fagreelikert.	;
		format	N22_1	fagreelikert.	;
		format	N23_1	fagreelikert.	;
		format	N25_1	fagreelikert.	;
		format	N26_1	fagreelikert.	;
		format	N27_1	fagreelikert.	;
		format	N28_1	fagreelikert.	;
		format	N29_1	fagreelikert.	;
		format	N30_1	fagreelikert.	;
		format	N31_1	fagreelikert.	;
		format	N32_1	fagreelikert.	;
		format	N33_1	fagreelikert.	;
		format	N34_1	fagreelikert.	;
		format	N35_1	fagreelikert.	;
		format	N36_1	fagreelikert.	;
		format	N37_1	fagreelikert.	;
		format	N38_1	fagreelikert.	;
		format	N39_1	fagreelikert.	;
		format	N40_1	fagreelikert.	;
		format	N41_1	fagreelikert.	;
		format	N42_1	fagreelikert.	;
		format	R01_1	fagreelikert.	;
		format	R02_1	fagreelikert.	;
		format	R03_1	fagreelikert.	;
		format	R04_1	fagreelikert.	;
		format	R05_1	fagreelikert.	;
		format	R06_1	fagreelikert.	;
		format	R07_1	fagreelikert.	;
		format	R08_1	fagreelikert.	;
		format	R09_1	fagreelikert.	;
		format	R10_1	fagreelikert.	;
		format	R11_1	fagreelikert.	;
		format	R12_1	fagreelikert.	;
		format	R13_1	fagreelikert.	;
		format	R14_1	fagreelikert.	;
		format	R15_1	fagreelikert.	;
		format	R16_1	fagreelikert.	;
		format	R17_1	fagreelikert.	;
		format	R18_1	fagreelikert.	;
		format	R19_1	fagreelikert.	;
		format	R20_1	fagreelikert.	;
		format	R21_1	fagreelikert.	;
		format	R22_1	fagreelikert.	;
		format	R23_1	fagreelikert.	;
		format	R24_1	fagreelikert.	;
		format	R25_1	fagreelikert.	;
		format	R26_1	fagreelikert.	;
		format	R27_1	fagreelikert.	;
		format	R28_1	fagreelikert.	;
		format	R29_1	fagreelikert.	;
		format	R30_1	fagreelikert.	;
		format	R31_1	fagreelikert.	;
		format	W01	fyn.	;
		format	W04	fyn.	;
		format	W05	fyn.	;
		format	SD04	fhouseholds.	;
		format	SD05	fyn.	;
		format	SD08	fyn.	;
		format	SD09	fbringwater.	;
		format	SD10	fyn.	;
		format	SD11	fyn.	;
		format	SD12	fyn.	;
		format	SD13	fyn.	;
		format	SD14	fyn.	;
		format	SD15	fyn.	;
		format	SD16	fyn.	;
		format	SD17	fyn.	;
		format	SD18	fyn.	;
		format	SU05	fhouseholds.	;
		format	SU06	fyn.	;
		format	SU09	fyn.	;
		format	SU10	fbringwater.	;
		format	SU11	fyn.	;
		format	SU12	fyn.	;
		format	SU13	fyn.	;
		format	SU14	fyn.	;
		format	SU15	fyn.	;
		format	SU16	fyn.	;
		format	SU17	fyn.	;
		format	SU18	fyn.	;
		format	SU19	fyn.	;
		format	SG01	fyn.	;
		format	SG02	fyn.	;
		format	SG02a	fyn.	;
		format	SG03	fyn.	;
		format	SG04	fyn.	;
		format	SG05	fyn.	;
		format	DMV01	fcomfortlikert.	;
		format	DMV02	fcomfortlikert.	;
		format	DMV03	fpermit.	;
		format	DMV04	fpermit.	;
		format	DMV05	fpermit.	;
		format	LV01	fagreeSlikertmid.	;
		format	LV02	fagreeSlikertmid.	;
		format	LV03	fagreeSlikertmid.	;
		format	CAV01	fagreeSlikertmid.	;
		format	CAV02	fagreeSlikertmid.	;
		format	CAV03	fagreeSlikertmid.	;
		format	CAV04	fagreeSlikertmid.	;
		format	CAV05	fagreeSlikertmid.	;
		format	MV01	fpermityn.	;
		format	MV02	fpermityn.	;
		format	MV03	fpermityn.	;
		format	HV01	fexlikert.	;
		format	HV02	ftime.	;
		format	HV03	ftime.	;
		format	HV04	ftime.	;
		format	HV05	ftime.	;
		format	HV06	ftime.	;
		format	HV07	fmh.	;
		format	HV08	fmh.	;
		format	HV09	fmh.	;
		format	HV10	fmh.	;
		format	CCV01	ftrue.	;
		format	CCV02	ftrue.	;
		format	CCV03	ftrue.	;
		format	CCV04	ftrue.	;
		format	CCV05	ftrue.	;
		format	CCV06	ftrue.	;
		format	FV01	fmoney.	;
		format	SCV01	fagreeClikertmid.	;
		format	SCV02	fagreeClikertmid.	;
		format	SCV03	fagreeClikertmid.	;
		format	SCV04	fagreeClikertmid.	;
		format	SCV05	fagreeClikertmid.	;
		format	SCV06	fagreeClikertmid.	;
		format	SCV07	fagreeClikertmid.	;
		format	SCV08	fagreeClikertmid.	;
		format	RV01	ffreqlikertmid.	;
		format	RV02	ffreqlikertmid.	;
		format	RV03	ffreqlikertmid.	;
		format	NV01	fagreelikert.	;
		format	NV02	fagreelikert.	;
		format	NV03	fagreelikert.	;
		format	NV04	fagreelikert.	;
		format	FLQ		fyn.	;
		format	CCH		fyn.	;
		format	DE01	fhome.	;
		format	DE02I_1	ftf.	;
		format	DE02I_2	ftf.	;
		format	DE02I_3	ftf.	;
		format	DE02I_4	ftf.	;
		format	DE02I_5	ftf.	;
		format	DE02I_6	ftf.	;
		format	DE02I_7	ftf.	;
		format	DE02I_8	ftf.	;
		format	DE02I_9	ftf.	;
		format	DE02I_10	ftf.	;
		format	DE02I_11	ftf.	;
		format	DE02I_12	ftf.	;
		format	DE02I_13	ftf.	;
		format	DE02I_99	ftf.	;
		format	DE02I_88	ftf.	;
		format	DE02I_77	ftf.	;
		format	DE02I_66	ftf.	;
		format	DE02U_1	ftf.	;
		format	DE02U_2	ftf.	;
		format	DE02U_3	ftf.	;
		format	DE02U_4	ftf.	;
		format	DE02U_5	ftf.	;
		format	DE02U_6	ftf.	;
		format	DE02U_7	ftf.	;
		format	DE02U_8	ftf.	;
		format	DE02U_9	ftf.	;
		format	DE02U_10	ftf.	;
		format	DE02U_11	ftf.	;
		format	DE02U_99	ftf.	;
		format	DE02U_88	ftf.	;
		format	DE02U_77	ftf.	;
		format	DE02U_66	ftf.	;
		format	DE03I_1	ftf.	;
		format	DE03I_2	ftf.	;
		format	DE03I_3	ftf.	;
		format	DE03I_4	ftf.	;
		format	DE03I_5	ftf.	;
		format	DE03I_6	ftf.	;
		format	DE03I_7	ftf.	;
		format	DE03I_8	ftf.	;
		format	DE03I_9	ftf.	;
		format	DE03I_10	ftf.	;
		format	DE03I_11	ftf.	;
		format	DE03I_12	ftf.	;
		format	DE03I_13	ftf.	;
		format	DE03I_14	ftf.	;
		format	DE03I_15	ftf.	;
		format	DE03I_16	ftf.	;
		format	DE03I_17	ftf.	;
		format	DE03I_18	ftf.	;
		format	DE03I_19	ftf.	;
		format	DE03I_99	ftf.	;
		format	DE03I_88	ftf.	;
		format	DE03I_77	ftf.	;
		format	DE03I_66	ftf.	;
		format	DE03U_1	ftf.	;
		format	DE03U_2	ftf.	;
		format	DE03U_3	ftf.	;
		format	DE03U_4	ftf.	;
		format	DE03U_5	ftf.	;
		format	DE03U_6	ftf.	;
		format	DE03U_7	ftf.	;
		format	DE03U_8	ftf.	;
		format	DE03U_9	ftf.	;
		format	DE03U_10	ftf.	;
		format	DE03U_11	ftf.	;
		format	DE03U_12	ftf.	;
		format	DE03U_13	ftf.	;
		format	DE03U_14	ftf.	;
		format	DE03U_99	ftf.	;
		format	DE03U_88	ftf.	;
		format	DE03U_77	ftf.	;
		format	DE03U_66	ftf.	;
		format	DE04I_1	ftf.	;
		format	DE04I_2	ftf.	;
		format	DE04I_3	ftf.	;
		format	DE04I_4	ftf.	;
		format	DE04I_5	ftf.	;
		format	DE04I_6	ftf.	;
		format	DE04I_7	ftf.	;
		format	DE04I_8	ftf.	;
		format	DE04I_9	ftf.	;
		format	DE04I_10	ftf.	;
		format	DE04I_11	ftf.	;
		format	DE04I_12	ftf.	;
		format	DE04I_13	ftf.	;
		format	DE04I_14	ftf.	;
		format	DE04I_15	ftf.	;
		format	DE04I_99	ftf.	;
		format	DE04I_88	ftf.	;
		format	DE04I_77	ftf.	;
		format	DE04I_66	ftf.	;
		format	DE04U_1	ftf.	;
		format	DE04U_2	ftf.	;
		format	DE04U_3	ftf.	;
		format	DE04U_4	ftf.	;
		format	DE04U_5	ftf.	;
		format	DE04U_6	ftf.	;
		format	DE04U_7	ftf.	;
		format	DE04U_8	ftf.	;
		format	DE04U_9	ftf.	;
		format	DE04U_10	ftf.	;
		format	DE04U_11	ftf.	;
		format	DE04U_12	ftf.	;
		format	DE04U_13	ftf.	;
		format	DE04U_14	ftf.	;
		format	DE04U_15	ftf.	;
		format	DE04U_16	ftf.	;
		format	DE04U_17	ftf.	;
		format	DE04U_99	ftf.	;
		format	DE04U_88	ftf.	;
		format	DE04U_77	ftf.	;
		format	DE04U_66	ftf.	;
run;

/*************************************************/
/*  				 LABEL DATA				     */
/*************************************************/
data work.muselabel;
set work.museformat;
	label
		SCR01	=	"Enumerator Name/ID"
		SCR02	=	"Country"
		SCR03	=	"Neighborhood ID"
		SCR04	=	"Original or Retest"
		SCR05a	=	"Phone Number"
		SCR05b	=	"Original PID"
		SCR06	=	"18 or older"
		SCR07I	=	"Do you speak Tamil?"
		SCR07U	=	"Luganda or English"
		SCR08	=	"Permanent Resident"
		SCR09	=	"Cognitive Interview Participant"
		D01	=	"Age"
		D02	=	"Ever attend school"
		D03	=	"Highest level of education completed"
		D03noschool	=	"No school Y/N"
		D04	=	"Do you read a newspaper or magazine at least once a week, less than once a week, or not at all?"
		D05	=	"Do you listen to the radio at least once a week, less than once a week, or not at all?"
		D06	=	"Do you watch television at least once a week, less than once a week, or not at all?"
		D07	=	"Ever used the Internet Y/N"
		D08	=	"Work in any income-generating activities Y/N"
		D09	=	"Hours spent away from home on a typical day"
		D10	=	"Marital status"
		D11	=	"Age when first married"
		D12	=	"Number of people living in household permanently, including children"
		D13_1	=	"Currently live with - Mother"
		D13_2	=	"Currently live with - Father"
		D13_3	=	"Currently live with - MIL"
		D13_4	=	"Currently live with - FIL"
		D13_5	=	"Currently live with - Husband/Boyfriend/Partner"
		D13_6	=	"Currently live with - Child(ren) or grandchild(ren) under age 18"
		D13_7	=	"Currently live with - adult child(ren) or grandchild(ren) over age 18"
		D13_8	=	"Currently live with - other relatives"
		D13_9	=	"Currently live with - hired help (maids, security guard, etc.)"
		D13_10	=	"Currently live with - no one (live alone)"
		D13_99	=	"Currently live with - other"
		D13_88	=	"Currently live with - Don't know"
		D13_77	=	"Currently live with - N/A"
		D13_66	=	"Currently live with - No response"
		D13_others	=	"Currently live with - others, please specify"
		D14_1	=	"Age of children in household - 0"
		D14_2	=	"Age of children in household - 1"
		D14_3	=	"Age of children in household - 2"
		D14_4	=	"Age of children in household - 3"
		D14_5	=	"Age of children in household - 4"
		D14_6	=	"Age of children in household  - 5"
		D14_7	=	"Age of children in household  - 6"
		D14_8	=	"Age of children in household  - 7"
		D14_9	=	"Age of children in household - 8"
		D14_10	=	"Age of children in household  - 9"
		D14_11	=	"Age of children in household - 10"
		D14_12	=	"Age of children in household  - 11"
		D14_13	=	"Age of children in household  - 12"
		D14_14	=	"Age of children in household - 13"
		D14_15	=	"Age of children in household  - 14"
		D14_16	=	"Age of children in household - 15"
		D14_17	=	"Age of children in household - 16"
		D14_18	=	"Age of children in household - 17"
		D14_19	=	"Age of children in household  - 18 or older"
		D14_88	=	"Age of children in household - Don't know"
		D14_77	=	"Age of children in household - N/A"
		D14_66	=	"Age of children in household - No reponse"
		D15	=	"Does the land where your house is built belong to you or your family?"
		D16	=	"Religion"
		D16_others	=	"Religion - other"
		D17I	=	"Caste"
		D17U	=	"Ethnic group"
		D17U_others	=	"Ethnic group - other"
		D18	=	"Place of birth"
		D19	=	"Years living in this city"
		D21	=	"Liklihood of moving in next 12 months"
		D20	=	"Years living in this neighborhood"
		D22I_1	=	"Asset index, India - electricity"
		D22I_2	=	"Asset index, India - mattress"
		D22I_3	=	"Asset index, India - pressure cooker"
		D22I_4	=	"Asset index, India - chair"
		D22I_5	=	"Asset index, India - cot or bed"
		D22I_6	=	"Asset index, India -  table"
		D22I_7	=	"Asset index, India - electric fan"
		D22I_8	=	"Asset index, India - radio or transistor"
		D22I_9	=	"Asset index, India - television"
		D22I_10	=	"Asset index, India - sewing machine"
		D22I_11	=	"Asset index, India - mobile phone"
		D22I_12	=	"Asset index, India - land line phone"
		D22I_13	=	"Asset index, India - Internet"
		D22I_14	=	"Asset index, India - computer"
		D22I_15	=	"Asset index, India - refrigerator"
		D22I_16	=	"Asset index, India - air conditioner/cooler"
		D22I_17	=	"Asset index, India - washing machine"
		D22I_18	=	"Asset index, India - water pump"
		D22I_19	=	"Asset index, India - thresher"
		D22I_20	=	"Asset index, India - tractor"
		D22I_21	=	"Asset index, India - None of the above"
		D22I_88	=	"Asset index, India - Don't know"
		D22I_77	=	"Asset index, India - N/A"
		D22I_66	=	"Asset index, India - No response"
		D22U_1	=	"Asset index, Uganda - Electricity"
		D22U_2	=	"Asset index, Uganda - Radio"
		D22U_3	=	"Asset index, Uganda - Black and white television"
		D22U_4	=	"Asset index, Uganda - Color television"
		D22U_5	=	"Asset index, Uganda - Non-mobile television"
		D22U_6	=	"Asset index, Uganda - Computer"
		D22U_7	=	"Asset index, Uganda - Refrigerator"
		D22U_8	=	"Asset index, Uganda - Cassette/CD/DVD Player"
		D22U_9	=	"Asset index, Uganda - Table"
		D22U_10	=	"Asset index, Uganda - Chair"
		D22U_11	=	"Asset index, Uganda - Sofa set"
		D22U_12	=	"Asset index, Uganda - Bed"
		D22U_13	=	"Asset index, Uganda - Cupboard"
		D22U_14	=	"Asset index, Uganda - Clock"
		D22U_15	=	"Asset index, Uganda - Watch"
		D22U_16	=	"Asset index, Uganda - Mobile Phone"
		D22U_17	=	"Asset index, Uganda - None of the above"
		D22U_88	=	"Asset index, Uganda - Don't know"
		D22U_77	=	"Asset index, Uganda - N/A"
		D22U_66	=	"Asset index, Uganda - No response"
		D23I_1	=	"Asset index, India transportation - Bicycle"
		D23I_2	=	"Asset index, India transportation - Motorcycle or scooter"
		D23I_3	=	"Asset index, India transportation - Animal-drawn cart"
		D23I_4	=	"Asset index, India transportation - car"
		D23I_5	=	"Asset index, India transportation - Autorickshaw"
		D23I_6	=	"Asset index, India transportation - Lorry/truck"
		D23I_7	=	"Asset index, India transportation - None of the above"
		D23I_88	=	"Asset index, India transportation - Don't know"
		D23I_77	=	"Asset index, India transportation - N/A"
		D23I_66	=	"Asset index, India transportation - No response"
		D23U_1	=	"Asset index, Uganda transportation - Bicycle"
		D23U_2	=	"Asset index, Uganda transportation - Animal-drawn cart"
		D23U_3	=	"Asset index, Uganda transportation - Motorcycle/scooter"
		D23U_4	=	"Asset index, Uganda transportation - Car/truck"
		D23U_5	=	"Asset index, Uganda transportation - Boat with a motor"
		D23U_6	=	"Asset index, Uganda transportation - Boat without a motor"
		D23U_7	=	"Asset index, Uganda transportation - None of the above"
		D23U_88	=	"Asset index, Uganda transportation - Don't know"
		D23U_77	=	"Asset index, Uganda transportation - N/A"
		D23U_66	=	"Asset index, Uganda transportation - No response"
		D24I_1	=	"Asset index, India land/animals - Agricultural land"
		D24I_2	=	"Asset index, India land/animals - Farm animals"
		D24I_3	=	"Asset index, India land/animals - None of the above"
		D24I_88	=	"Asset index, India land/animals - Don't know"
		D24I_77	=	"Asset index, India land/animals - N/A"
		D24I_66	=	"Asset index, India land/animals - No response"
		D24U_1	=	"Asset index, Uganda land/animals - Agricultural land"
		D24U_2	=	"Asset index, Uganda land/animals - Farm animals"
		D24U_3	=	"Asset index, Uganda land/animals - None of the above"
		D24U_88	=	"Asset index, Uganda land/animals - Don't know"
		D24U_77	=	"Asset index, Uganda land/animals - N/A"
		D24U_66	=	"Asset index, Uganda land/animals - No response"
		SD01	=	"Sanitation location for defecation during day, at home"
		SD01a	=	"Sanitation facility type for defecation during day, at home"
		SD01a_others	=	"Sanitation facility type for defecation during day, at home - other"
		SD02	=	"Share sanitation location for defecation during day with individuals outside of household"
		SD03	=	"Share sanitation location for defecation during day with individuals outside of household - known or general public"
		SU01	=	"Is the place where you go for defecation during the day the same location you usually use for urination during the day?"
		SU02	=	"Sanitation location for urination during day, at home"
		SU02a	=	"Sanitation facility type for urination during day, at home"
		SU02a_others	=	"Sanitation facility type for urination during day, at home - other"
		SU03	=	"Share sanitation location for urination during day with individuals outside of household"
		SU04	=	"Share sanitation location for urination during day with individuals outside of household - known or general public"
		SU20	=	"Is there a different location you would use if you had to urinate at night and were not able to wait until morning?"
		SU21	=	"Sanitation facility type for urination at night"
		SU21_others	=	"Sanitation facility type for urination at night - other"
		SD19	=	"Is there a different location you would use if you had to defecate at night and were not able to wait until morning?"
		SD20	=	"Sanitation facility type for defecation at night"
		SD20_others	=	"Sanitation facility type for defecation at night - other"
		MC01	=	"Experienced a menstrual period in previous 3 months Y/N"
		MH02	=	"Materials used most often in past 3 menstrual cycles"
		MH02_others	=	"Materials used most often in past 3 menstrual cycles - other"
		MH03	=	"Where do you most often change your absorbent material when at home during the day?"
		MH04	=	"Where do you most often change your absorbent material when at home at night?"
		MH05	=	"When you dispose of the absorbent material, where do you put it?"
		FLQ	=	"Willing to participate in follow-up Y/N"
		PHN	=	"Phone number for confirmation"
		DE01	=	"Type of home"
		SD19	=	"Is there a different location you would use if you had to defecate at night and were not able to wait until morning?"
		SU20	=	"Is there a different location you would use if you had to urinate at night and were not able to wait until morning?"
		SD04	=	"How many households in total use this sanitation location, including your own household?"
		SD05	=	"Do men also use this sanitation location?"
		SD07	=	"How many minutes do you need to walk to this sanitation location?"
		SD08	=	"Do you pay money for this sanitation location?"
		SD09	=	"Do you  have to carry water with you to this sanitation location? "
		SD10	=	"Is it possible for someone to see you while you are using this sanitation location?"
		SD11	=	"Is this sanitation location lockable from the inside?"
		SD12	=	"Does this sanitation location  have sufficient lighting on the inside?"
		SD13	=	"Is there sufficient lighting on the way to this sanitation location?"
		SD14	=	"Is it physically challenging to access or use this sanitation location?"
		SD15	=	"Is there sufficient room inside this sanitation location?"
		SD16	=	"In the past month (30 days) has there been any problem with the functioning of your toilet/latrine that has prevented you from using it? "
		SD17	=	"Do you usually have to wait at this sanitation location before you can use it?"
		SD18	=	"Is this sanitation location located in a private place?"
		SU05	=	"How many households in total use this sanitation location, including your own household?"
		SU06	=	"Do men also use this sanitation location?"
		SU08	=	"How many minutes do you need to walk to this sanitation location?"
		SU09	=	"Do you pay money for this sanitation location?"
		SU10	=	"Do you  have to carry water with you to this sanitation location?"
		SU11	=	"Is it possible for someone to see you while you are using this sanitation location?"
		SU12	=	"Is this sanitation location lockable from the inside?"
		SU13	=	"Does this sanitation location have sufficient lighting on the inside?"
		SU14	=	"Is there sufficient lighting on the way to this sanitation location?"
		SU15	=	"Is it physically challenging to access or use this sanitation location?"
		SU16	=	"Is there sufficient room inside this sanitation location?"
		SU17	=	"In the past month (30 days) has there been any problem with the functioning of your toilet/latrine that has prevented you from using it? "
		SU18	=	"Do you usually have to wait at this sanitation location before you can use it?"
		SU19	=	"Is this sanitation location located in a private place?"
; 
run;

/**********************************************************************************/
/*  			SCORE VALIDATED MEASURES AND CALCULATE NEW VARIABLES			  */
/**********************************************************************************/

proc format;
value fagecat   1='18-29'  2='30-39' 3='40-49' 4='50-59' 5='60-69' 6='70+';
value fresidence  1='Less than 5 years'  2='5-10 years' 3='More than 10 years';
value freligioncat  1='Christian'  2='Hindu' 3='Muslim' 4='Other';
value feducat  1='Less than primary'  2='Completed primary' 3='Completed secondary' 4='Higher than secondary';
value fhousemat  1='Natural'  2='Rudimentary' 3='Finished' 4='Other';
value fquint  0='Lowest'  1='Second' 2='Middle' 3='Fourth' 4='Highest';
value fwatertime  0='0-5 minutes'  1='6-10 minutes' 2='11-25 minutes' 3='26-60 minutes' 4='More than 60 minutes' 77='N/A';
value fwaterfreq  0='0 times'  1='1-7 times' 2='8+ times' 77='N/A';
value fhousemat 1="Natural" 2="Rudimentary" 3="Finished" 88="Other" 66="No Response" 77="N/A" 99="Missing";
value ftimemin 1="Less than 5 minutes" 2="More than 5 minutes" 88="Other" 66="No Response" 77="N/A" 99="Missing";
value fchildage 1="0-5" 2="6-12" 3="13-18+" 88="Other" 66="No Response" 77="N/A";
run;

data work.musecalcvar; 
set work.muselabel;
* Create age categories of 18-40, 40-65,65+;
age_cat=.; 
if (D01>=18 and D01<30) then age_cat=1; 
else if (D01>=30 and D01<40) then age_cat=2;
else if (D01>=40 and D01<50) then age_cat=3;
else if (D01>=50 and D01<60) then age_cat=4;
else if (D01>=60 and D01<70) then age_cat=5;
else if (D01>=70) then age_cat=6;
label age_cat="Age"; 
format age_cat fagecat.; 
* Create length of residence categories of less than 5 years, 5-10 years, more than 10 years;
lengthofresidence_cat=.; 
if (D19>=0 and D19<5) then lengthofresidence_cat=1; 
else if (D19>=5 and D19<10) then lengthofresidence_cat=2;
else if (D19>=10) then lengthofresidence_cat=3;
label lengthofresidence_cat="Length of residence in the city"; 
format lengthofresidence_cat fresidence.; 
* Create religion categories of Christian, Hindu, Muslim, Other;
religion_cat=.; 
if (D16=1 or D16=2) then religion_cat=1; 
else if (D16=4) then religion_cat=2;
else if (D16=3) then religion_cat=3;
else if (D16=5 or D16=6 or D16=7 or D16=8) then religion_cat=3;
label religion_cat="Religion"; 
format religion_cat freligioncat.; 
edu_cat=.; 
if (D03=1) then edu_cat=1; 
else if (D03>=2 and D03<6) then edu_cat=2;
else if (D03=6) then edu_cat=3;
else if (D03>=7 and D03<10) then edu_cat=4;
label edu_cat="Education"; 
format edu_cat feducat.;
floormatI_cat=.; 
if (DE02I_1=1 or DE02I_2=1 or DE02I_3=1) then floormatI_cat=1; 
else if (DE02I_4=1 or DE02I_5=1 or DE02I_6=1 or DE02I_7=1) then floormatI_cat=2;
else if (DE02I_8=1 or DE02I_9=1 or DE02I_10=1 or DE02I_11=1 or DE02I_12=1 or DE02I_13=1) then floormatI_cat=3;
else if (DE02I_88=1) then floormatI_cat=88;
else if (DE02I_66=1) then floormatI_cat=66;
else if (DE02I_77=1) then floormatI_cat=77;
else if (DE02I_99=1) then floormatI_cat=99;
label floormatI_cat="Floor material - India"; 
format floormatI_cat fhousemat.;
floormatU_cat=.; 
if (DE02U_1=1 or DE02U_2=1) then floormatU_cat=1; 
else if (DE02U_3=1 or DE02U_4=1) then floormatU_cat=2;
else if (DE02U_5=1 or DE02U_6=1 or DE02U_7=1 or DE02U_8=1 or DE02U_9=1 or DE02U_10=1 or DE02U_11=1) then floormatU_cat=3;
else if (DE02U_88=1) then floormatU_cat=88;
else if (DE02U_66=1) then floormatU_cat=66;
else if (DE02U_77=1) then floormatU_cat=77;
else if (DE02U_99=1) then floormatU_cat=99;
label floormatU_cat="Floor material - Uganda"; 
format floormatU_cat fhousemat.; 
roofmatI_cat=.; 
if (DE03I_1=1 or DE03I_2=1 or DE03I_3=1 or DE03I_4=1 or DE03I_5=1) then roofmatI_cat=1; 
else if (DE03I_6=1 or DE03I_7=1 or DE03I_7=1 or DE03I_8=1 or DE03I_9=1 or DE03I_10=1) then roofmatI_cat=2;
else if (DE03I_11=1 or DE03I_12=1 or DE03I_13=1 or DE03I_14=1 or DE03I_15=1 or DE03I_16=1 or DE03I_17=1 or DE03I_18=1 or DE03I_19=1) then roofmatI_cat=3;
else if (DE03I_88=1) then roofmatI_cat=88;
else if (DE03I_66=1) then roofmatI_cat=66;
else if (DE03I_77=1) then roofmatI_cat=77;
else if (DE03I_99=1) then roofmatI_cat=99;
label roofmatI_cat="Roof material - India"; 
format roofmatI_cat fhousemat.;
roofmatU_cat=.; 
if (DE03U_1=1 or DE03U_2=1 or DE03U_3=1) then roofmatU_cat=1; 
else if (DE03U_4=1 or DE03U_5=1 or DE03U_6=1 or DE03U_7=1 or DE03U_8=1) then roofmatU_cat=2;
else if (DE03U_9=1 or DE03U_10=1 or DE03U_11=1 or DE03U_12=1 or DE03U_13=1 or DE03U_14=1) then roofmatU_cat=3;
else if (DE03U_88=1) then roofmatU_cat=88;
else if (DE03U_66=1) then roofmatU_cat=66;
else if (DE03U_77=1) then roofmatU_cat=77;
else if (DE03U_99=1) then roofmatU_cat=99;
label roofmatU_cat="Roof material - Uganda"; 
format roofmatU_cat fhousemat.; 
wallmatI_cat=.; 
if (DE04I_1=1 or DE04I_2=1 or DE04I_3=1 or DE04I_4=1) then wallmatI_cat=1; 
else if (DE04I_5=1 or DE04I_6=1 or DE04I_7=1 or DE04I_8=1 or DE04I_9=1) then wallmatI_cat=2;
else if (DE04I_10=1 or DE04I_11=1 or DE04I_12=1 or DE04I_13=1 or DE04I_14=1 or DE04I_15=1) then wallmatI_cat=3;
else if (DE04I_88=1) then wallmatI_cat=88;
else if (DE04I_66=1) then wallmatI_cat=66;
else if (DE04I_77=1) then wallmatI_cat=77;
else if (DE04I_99=1) then wallmatI_cat=99;
label wallmatI_cat="Wall material - India"; 
format wallmatI_cat fhousemat.;
wallmatU_cat=.; 
if (DE04U_1=1 or DE04U_2=1 or DE04U_3=1) then wallmatU_cat=1; 
else if (DE04U_4=1 or DE04U_5=1 or DE04U_6=1 or DE04U_7=1 or DE04U_8=1 or DE04U_9=1 or DE04U_10=1 or DE04U_11=1) then wallmatU_cat=2;
else if (DE04U_12=1 or DE04U_13=1 or DE04U_14=1 or DE04U_15=1 or DE04U_16=1 or DE04U_17=1) then wallmatU_cat=3;
else if (DE04U_88=1) then wallmatU_cat=88;
else if (DE04U_66=1) then wallmatU_cat=66;
else if (DE04U_77=1) then wallmatU_cat=77;
else if (DE04U_99=1) then wallmatU_cat=99;
label wallmatU_cat="Wall material - Uganda"; 
format wallmatU_cat fhousemat.;
childage_cat=.; 
if (D14_1=1 or D14_2=1 or D14_3=1 or D14_4=1 or D14_5=1 or D14_6=1) then childage_cat=1; 
else if (D14_8=1 or D14_9=1 or D13_10=1 or D14_11=1 or D14_12=1 or D13_6=1) then childage_cat=2;
else if (D14_14=1 or D14_15=1 or D14_16=1 or D14_7=1 or D14_18=1 or D14_19=1) then childage_cat=3;
else if (D14_88=1) then childage_cat=88;
else if (D14_66=1) then childage_cat=66;
else if (D14_77=1) then childage_cat=77;
label childage_cat="Age of Children"; 
format childage_cat fchildage.;
WI_Sum_I=.;
if SCR02=2 then WI_Sum_I=D22I_1+D22I_2+D22I_3+D22I_4+D22I_5+D22I_6+D22I_7+D22I_8+D22I_9+D22I_10+D22I_11+D22I_12+D22I_13+D22I_14+D22I_15+
			D22I_16+D22I_17+D22I_18+D22I_19+D22I_20+D23I_1+D23I_2+D23I_3+D23I_4+D23I_5+D23I_6+D24I_1+D24I_2; 
label WI_Sum_I="Sum of Wealth/Assets Index in India"; *Use + not sum command - using sum command will set missing values to 0, using + will set total to missing if any misisng values;
WI_Sum_U=.;
if SCR02=1 then WI_Sum_U=D22U_1+D22U_2+D22U_3+D22U_4+D22U_5+D22U_6+D22U_7+D22U_8+D22U_9+D22U_10+D22U_11+D22U_12+D22U_13+D22U_14+D22U_15+D22U_16+
		D23U_1+D23U_2+D23U_3+D23U_4+D23U_5+D23U_6+D24U_1+D24U_2;
label WI_Sum_U="Sum of Wealth/Assets Index in Uganda"; *Use + not sum command - using sum command will set missing values to 0, using + will set total to missing if any misisng values;
W02_cat=.;
if W02>=0 and W02<6 then W02_cat=0;
else if W02>=6 and W02<11 then W02_cat=1;
else if W02>=11 and W02<26 then W02_cat=2;
else if W02>=26 and W02<60 then W02_cat=3;
else if W02>=60 and W02<77 then W02_cat=4;
else if W02>77 then W02_cat=4;
else if W02=77 then W02_cat=77;
label W02_cat="Length of Time Spent Collecting Water";
format W02_cat fwatertime.;
W03_cat=.;
if W03=0 then W03_cat=0;
else if W03<=1 and W03<8 then W03_cat=1;
else if W03>=8 and W03<77 then W03_cat=2;
else if W03>77 then W03_cat=2;
else if W03=77 then W03_cat=77;
label W03_cat="Times per Week Collecting Water";
format W03_cat fwaterfreq.;
timewalkdef=.;
if SD07<5 then timewalkdef=1;
else if SD07>=5 and SD07<77 then timewalkdef=2;
else if SD07=77 then timewalkdef=77;
label timewalkdef="Minutes to walk to sanitation location (defecation)";
format timewalkdef ftimemin.;
timewalkur=.;
if SU08<5 then timewalkur=1;
else if SU08>=5 and SU08<77 then timewalkur=2;
else if SU08=77 then timewalkur=77;
label timewalkur="Minutes to walk to sanitation location (urination)";
format timewalkur ftimemin.;
run;
/*NOTE: The data set work.musecalcvar should have 2174 observations and 798 variables.*/

/************************************/
/*		REVERSE SCORE ITEMS     	*/
/************************************/
data work.muserev;
set work.musecalcvar;
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
/*NOTE: The data set work.muserev should have 2174 observations and 865 variables.*/


/****************************************/
/*		SCORE ALL SCALE AND INDICES		*/
/****************************************/
* Set all 66,77,88,99 values to missing for scale/index vars for scoring purposes;
* For indices, change "No" value from 2 to 0;
data work.musesetmiss;
set work.muserev;
if	DM23_1	in	(66,77,88,99)	then	DM23_1	 =.	;
if	DM24_1	in	(66,77,88,99)	then	DM24_1	 =.	;
if	DM25_1	in	(66,77,88,99)	then	DM25_1	 =.	;
if	DM26_1	in	(66,77,88,99)	then	DM26_1	 =.	;
if	DM27_1	in	(66,77,88,99)	then	DM27_1	 =.	;
if	DM28_1	in	(66,77,88,99)	then	DM28_1	 =.	;
if	DM29_1	in	(66,77,88,99)	then	DM29_1	 =.	;
if	DM30_1	in	(66,77,88,99)	then	DM30_1	 =.	;
if	DM31_1	in	(66,77,88,99)	then	DM31_1	 =.	;
if	DM35_1	in	(66,77,88,99)	then	DM35_1	 =.	;
if	DM36_1	in	(66,77,88,99)	then	DM36_1	 =.	;
if	DM37_1	in	(66,77,88,99)	then	DM37_1	 =.	;
if	DM38_1	in	(66,77,88,99)	then	DM38_1	 =.	;
if	DM39_1	in	(66,77,88,99)	then	DM39_1	 =.	;
if	DM40_1	in	(66,77,88,99)	then	DM40_1	 =.	;
if	DM41_1	in	(66,77,88,99)	then	DM41_1	 =.	;
if	DM42_1	in	(66,77,88,99)	then	DM42_1	 =.	;
if	DM43_1	in	(66,77,88,99)	then	DM43_1	 =.	;
if	DM44_1	in	(66,77,88,99)	then	DM44_1	 =.	;
if	DM45_1	in	(66,77,88,99)	then	DM45_1	 =.	;
if	DM46_1	in	(66,77,88,99)	then	DM46_1	 =.	;
if	DM47_1	in	(66,77,88,99)	then	DM47_1	 =.	;
if	DM48_1	in	(66,77,88,99)	then	DM48_1	 =.	;
if	DM49_1	in	(66,77,88,99)	then	DM49_1	 =.	;
if	DM51_1	in	(66,77,88,99)	then	DM51_1	 =.	;
if	DM52_1	in	(66,77,88,99)	then	DM52_1	 =.	;
if	DM53_1	in	(66,77,88,99)	then	DM53_1	 =.	;
if	DM06_1	in	(66,77,88,99)	then	DM06_1	 =.	;
if	DM05_1	in	(66,77,88,99)	then	DM05_1	 =.	;
if	DM04_1	in	(66,77,88,99)	then	DM04_1	 =.	;
if	DM03_1	in	(66,77,88,99)	then	DM03_1	 =.	;
if	DM02_1	in	(66,77,88,99)	then	DM02_1	 =.	;
if	DM01_1	in	(66,77,88,99)	then	DM01_1	 =.	;
if	DM18_1	in	(66,77,88,99)	then	DM18_1	 =.	;
if	DM17_1	in	(66,77,88,99)	then	DM17_1	 =.	;
if	DM16_1	in	(66,77,88,99)	then	DM16_1	 =.	;
if	DM15_1	in	(66,77,88,99)	then	DM15_1	 =.	;
if	DM14_1	in	(66,77,88,99)	then	DM14_1	 =.	;
if	DM13_1	in	(66,77,88,99)	then	DM13_1	 =.	;
if	DM12_1	in	(66,77,88,99)	then	DM12_1	 =.	;
if	DM11_1	in	(66,77,88,99)	then	DM11_1	 =.	;
if	DM10_1	in	(66,77,88,99)	then	DM10_1	 =.	;
if	DM09_1	in	(66,77,88,99)	then	DM09_1	 =.	;
if	DM08_1	in	(66,77,88,99)	then	DM08_1	 =.	;
if	L01_1	in	(66,77,88,99)	then	L01_1	 =.	;
if	L04_1	in	(66,77,88,99)	then	L04_1	 =.	;
if	L05_1	in	(66,77,88,99)	then	L05_1	 =.	;
if	L06_1	in	(66,77,88,99)	then	L06_1	 =.	;
if	L07_1_rev	in	(66,77,88,99)	then	L07_1_rev	 =.	;
if	L08_1_rev	in	(66,77,88,99)	then	L08_1_rev	 =.	;
if	L09_1	in	(66,77,88,99)	then	L09_1	 =.	;
if	L10_1	in	(66,77,88,99)	then	L10_1	 =.	;
if	L11_1	in	(66,77,88,99)	then	L11_1	 =.	;
if	L12_1	in	(66,77,88,99)	then	L12_1	 =.	;
if	L13_1_rev	in	(66,77,88,99)	then	L13_1_rev	 =.	;
if	L14_1	in	(66,77,88,99)	then	L14_1	 =.	;
if	L15_1	in	(66,77,88,99)	then	L15_1	 =.	;
if	L16_1	in	(66,77,88,99)	then	L16_1	 =.	;
if	L17_1_rev	in	(66,77,88,99)	then	L17_1_rev	 =.	;
if	L18_1	in	(66,77,88,99)	then	L18_1	 =.	;
if	L19_1	in	(66,77,88,99)	then	L19_1	 =.	;
if	L20_1	in	(66,77,88,99)	then	L20_1	 =.	;
if	L21_1	in	(66,77,88,99)	then	L21_1	 =.	;
if	CA01_1	in	(66,77,88,99)	then	CA01_1	 =.	;
if	CA02_1	in	(66,77,88,99)	then	CA02_1	 =.	;
if	CA03_1	in	(66,77,88,99)	then	CA03_1	 =.	;
if	CA04_1	in	(66,77,88,99)	then	CA04_1	 =.	;
if	CA05_1	in	(66,77,88,99)	then	CA05_1	 =.	;
if	CA06_1	in	(66,77,88,99)	then	CA06_1	 =.	;
if	CA07_1	in	(66,77,88,99)	then	CA07_1	 =.	;
if	CA08_1	in	(66,77,88,99)	then	CA08_1	 =.	;
if	CA09_1	in	(66,77,88,99)	then	CA09_1	 =.	;
if	CA10_1	in	(66,77,88,99)	then	CA10_1	 =.	;
if	CA11_1	in	(66,77,88,99)	then	CA11_1	 =.	;
if	CA12_1	in	(66,77,88,99)	then	CA12_1	 =.	;
if	CA14_1	in	(66,77,88,99)	then	CA14_1	 =.	;
if	CA15_1	in	(66,77,88,99)	then	CA15_1	 =.	;
if	CA16_1	in	(66,77,88,99)	then	CA16_1	 =.	;
if	CA17_1	in	(66,77,88,99)	then	CA17_1	 =.	;
if	CA18_1	in	(66,77,88,99)	then	CA18_1	 =.	;
if	CA19_1	in	(66,77,88,99)	then	CA19_1	 =.	;
if	CA21_1	in	(66,77,88,99)	then	CA21_1	 =.	;
if	CA22_1	in	(66,77,88,99)	then	CA22_1	 =.	;
if	CA23_1	in	(66,77,88,99)	then	CA23_1	 =.	;
if	CA24_1	in	(66,77,88,99)	then	CA24_1	 =.	;
if	M01_1	in	(66,77,88,99)	then	M01_1	 =.	;
if	M02_1	in	(66,77,88,99)	then	M02_1	 =.	;
if	M03_1	in	(66,77,88,99)	then	M03_1	 =.	;
if	M04_1	in	(66,77,88,99)	then	M04_1	 =.	;
if	M05_1	in	(66,77,88,99)	then	M05_1	 =.	;
if	M06_1	in	(66,77,88,99)	then	M06_1	 =.	;
if	M13_1	in	(66,77,88,99)	then	M13_1	 =.	;
if	M14_1	in	(66,77,88,99)	then	M14_1	 =.	;
if	M15_1	in	(66,77,88,99)	then	M15_1	 =.	;
if	M16_1	in	(66,77,88,99)	then	M16_1	 =.	;
if	M07_1	in	(66,77,88,99)	then	M07_1	 =.	;
if	M08_1	in	(66,77,88,99)	then	M08_1	 =.	;
if	M09_1	in	(66,77,88,99)	then	M09_1	 =.	;
if	M10_1	in	(66,77,88,99)	then	M10_1	 =.	;
if	M11_1	in	(66,77,88,99)	then	M11_1	 =.	;
if	M12_1	in	(66,77,88,99)	then	M12_1	 =.	;
if	M17_1	in	(66,77,88,99)	then	M17_1	 =.	;
if	M18_1	in	(66,77,88,99)	then	M18_1	 =.	;
if	M19_1	in	(66,77,88,99)	then	M19_1	 =.	;
if	M20_1	in	(66,77,88,99)	then	M20_1	 =.	;
if	M21_1	in	(66,77,88,99)	then	M21_1	 =.	;
if	M22_1	in	(66,77,88,99)	then	M22_1	 =.	;
if	BI01_1	in	(66,77,88,99)	then	BI01_1	 =.	;
if	BI02_1	in	(66,77,88,99)	then	BI02_1	 =.	;
if	BI03_1	in	(66,77,88,99)	then	BI03_1	 =.	;
if	BI04_1	in	(66,77,88,99)	then	BI04_1	 =.	;
if	BI05_1_rev	in	(66,77,88,99)	then	BI05_1_rev	 =.	;
if	BI06_1	in	(66,77,88,99)	then	BI06_1	 =.	;
if	BI07_1_rev	in	(66,77,88,99)	then	BI07_1_rev	 =.	;
if	BI08_1_rev	in	(66,77,88,99)	then	BI08_1_rev	 =.	;
if	BI09_1_rev	in	(66,77,88,99)	then	BI09_1_rev	 =.	;
if	BI10_1_rev	in	(66,77,88,99)	then	BI10_1_rev	 =.	;
if	BI11_1_rev	in	(66,77,88,99)	then	BI11_1_rev	 =.	;
if	BI12_1_rev	in	(66,77,88,99)	then	BI12_1_rev	 =.	;
if	BI13_1_rev	in	(66,77,88,99)	then	BI13_1_rev	 =.	;
if	BI14_1	in	(66,77,88,99)	then	BI14_1	 =.	;
if	BI15_1	in	(66,77,88,99)	then	BI15_1	 =.	;
if	BI16_1	in	(66,77,88,99)	then	BI16_1	 =.	;
if	BI17_1	in	(66,77,88,99)	then	BI17_1	 =.	;
if	BI18_1_rev	in	(66,77,88,99)	then	BI18_1_rev	 =.	;
if	BI19_1_rev	in	(66,77,88,99)	then	BI19_1_rev	 =.	;
if	BI20_1_rev	in	(66,77,88,99)	then	BI20_1_rev	 =.	;
if	H01_1	in	(66,77,88,99)	then	H01_1	 =.	;
if	H02_1	in	(66,77,88,99)	then	H02_1	 =.	;
if	H03_1	in	(66,77,88,99)	then	H03_1	 =.	;
if	H04_1	in	(66,77,88,99)	then	H04_1	 =.	;
if	H05_1	in	(66,77,88,99)	then	H05_1	 =.	;
if	H06_1	in	(66,77,88,99)	then	H06_1	 =.	;
if	H07_1	in	(66,77,88,99)	then	H07_1	 =.	;
if	H08_1	in	(66,77,88,99)	then	H08_1	 =.	;
if	H09_1	in	(66,77,88,99)	then	H09_1	 =.	;
if	H10_1	in	(66,77,88,99)	then	H10_1	 =.	;
if	H11_1	in	(66,77,88,99)	then	H11_1	 =.	;
if	H12_1	in	(66,77,88,99)	then	H12_1	 =.	;
if	H13_1	in	(66,77,88,99)	then	H13_1	 =.	;
if	H14_1	in	(66,77,88,99)	then	H14_1	 =.	;
if	H15_1	in	(66,77,88,99)	then	H15_1	 =.	;
if	H16_1	in	(66,77,88,99)	then	H16_1	 =.	;
if	H17_1	in	(66,77,88,99)	then	H17_1	 =.	;
if	H18_1	in	(66,77,88,99)	then	H18_1	 =.	;
if	H19_1	in	(66,77,88,99)	then	H19_1	 =.	;
if	H20_1	in	(66,77,88,99)	then	H20_1	 =.	;
if	H22_1	in	(66,77,88,99)	then	H22_1	 =.	;
if	H23_1	in	(66,77,88,99)	then	H23_1	 =.	;
if	H24_1	in	(66,77,88,99)	then	H24_1	 =.	;
if	S01_1	in	(66,77,88,99)	then	S01_1	 =.	;
if	S02_1	in	(66,77,88,99)	then	S02_1	 =.	;
if	S03_1	in	(66,77,88,99)	then	S03_1	 =.	;
if	S08_1	in	(66,77,88,99)	then	S08_1	 =.	;
if	S09_1	in	(66,77,88,99)	then	S09_1	 =.	;
if	S10_1	in	(66,77,88,99)	then	S10_1	 =.	;
if	S11_1	in	(66,77,88,99)	then	S11_1	 =.	;
if	S12_1	in	(66,77,88,99)	then	S12_1	 =.	;
if	S13_1	in	(66,77,88,99)	then	S13_1	 =.	;
if	S14_1	in	(66,77,88,99)	then	S14_1	 =.	;
if	S15_1	in	(66,77,88,99)	then	S15_1	 =.	;
if	S04_1	in	(66,77,88,99)	then	S04_1	 =.	;
if	S05_1	in	(66,77,88,99)	then	S05_1	 =.	;
if	S06_1	in	(66,77,88,99)	then	S06_1	 =.	;
if	S07_1	in	(66,77,88,99)	then	S07_1	 =.	;
if	S16_1	in	(66,77,88,99)	then	S16_1	 =.	;
if	S17_1	in	(66,77,88,99)	then	S17_1	 =.	;
if	S18_1	in	(66,77,88,99)	then	S18_1	 =.	;
if	S19_1	in	(66,77,88,99)	then	S19_1	 =.	;
if	S20_1	in	(66,77,88,99)	then	S20_1	 =.	;
if	S21_1	in	(66,77,88,99)	then	S21_1	 =.	;
if	S22_1	in	(66,77,88,99)	then	S22_1	 =.	;
if	S23_1	in	(66,77,88,99)	then	S23_1	 =.	;
if	S24_1	in	(66,77,88,99)	then	S24_1	 =.	;
if	S25_1	in	(66,77,88,99)	then	S25_1	 =.	;
if	S26_1	in	(66,77,88,99)	then	S26_1	 =.	;
if	S27_1	in	(66,77,88,99)	then	S27_1	 =.	;
if	S28_1	in	(66,77,88,99)	then	S28_1	 =.	;
if	S29_1	in	(66,77,88,99)	then	S29_1	 =.	;
if	S30_1	in	(66,77,88,99)	then	S30_1	 =.	;
if	S31_1	in	(66,77,88,99)	then	S31_1	 =.	;
if	S32_1	in	(66,77,88,99)	then	S32_1	 =.	;
if	S33_1	in	(66,77,88,99)	then	S33_1	 =.	;
if	S34_1_rev	in	(66,77,88,99)	then	S34_1_rev	 =.	;
if	S35_1_rev	in	(66,77,88,99)	then	S35_1_rev	 =.	;
if	S36_1_rev	in	(66,77,88,99)	then	S36_1_rev	 =.	;
if	S37_1	in	(66,77,88,99)	then	S37_1	 =.	;
if	P01_1	in	(66,77,88,99)	then	P01_1	 =.	;
if	P02_1	in	(66,77,88,99)	then	P02_1	 =.	;
if	P03_1	in	(66,77,88,99)	then	P03_1	 =.	;
if	P04_1	in	(66,77,88,99)	then	P04_1	 =.	;
if	P05_1	in	(66,77,88,99)	then	P05_1	 =.	;
if	P06_1	in	(66,77,88,99)	then	P06_1	 =.	;
if	P07_1	in	(66,77,88,99)	then	P07_1	 =.	;
if	P08_1	in	(66,77,88,99)	then	P08_1	 =.	;
if	P09_1	in	(66,77,88,99)	then	P09_1	 =.	;
if	P10_1	in	(66,77,88,99)	then	P10_1	 =.	;
if	P11_1	in	(66,77,88,99)	then	P11_1	 =.	;
if	P12_1	in	(66,77,88,99)	then	P12_1	 =.	;
if	CC01_1	in	(66,77,88,99)	then	CC01_1	 =.	;
if	CC02_1	in	(66,77,88,99)	then	CC02_1	 =.	;
if	CC03_1	in	(66,77,88,99)	then	CC03_1	 =.	;
if	CC04_1	in	(66,77,88,99)	then	CC04_1	 =.	;
if	CC05_1	in	(66,77,88,99)	then	CC05_1	 =.	;
if	CC06_1	in	(66,77,88,99)	then	CC06_1	 =.	;
if	CC07_1	in	(66,77,88,99)	then	CC07_1	 =.	;
if	CC08_1	in	(66,77,88,99)	then	CC08_1	 =.	;
if	CC09_1	in	(66,77,88,99)	then	CC09_1	 =.	;
if	CC10_1	in	(66,77,88,99)	then	CC10_1	 =.	;
if	CC11_1	in	(66,77,88,99)	then	CC11_1	 =.	;
if	CC12_1	in	(66,77,88,99)	then	CC12_1	 =.	;
if	CC13_1_rev	in	(66,77,88,99)	then	CC13_1_rev	 =.	;
if	CC14_1	in	(66,77,88,99)	then	CC14_1	 =.	;
if	CC15_1	in	(66,77,88,99)	then	CC15_1	 =.	;
if	CC16_1	in	(66,77,88,99)	then	CC16_1	 =.	;
if	CC17_1	in	(66,77,88,99)	then	CC17_1	 =.	;
if	CC18_1_rev	in	(66,77,88,99)	then	CC18_1_rev	 =.	;
if	CC19_1_rev	in	(66,77,88,99)	then	CC19_1_rev	 =.	;
if	CC23_1	in	(66,77,88,99)	then	CC23_1	 =.	;
if	CC24_1_rev	in	(66,77,88,99)	then	CC24_1_rev	 =.	;
if	F02_1	in	(66,77,88,99)	then	F02_1	 =.	;
if	F01_1	in	(66,77,88,99)	then	F01_1	 =.	;
if	F03_1	in	(66,77,88,99)	then	F03_1	 =.	;
if	F04_1	in	(66,77,88,99)	then	F04_1	 =.	;
if	F05_1	in	(66,77,88,99)	then	F05_1	 =.	;
if	F06_1_rev	in	(66,77,88,99)	then	F06_1_rev	 =.	;
if	F07_1	in	(66,77,88,99)	then	F07_1	 =.	;
if	F08_1	in	(66,77,88,99)	then	F08_1	 =.	;
if	F10_1_rev	in	(66,77,88,99)	then	F10_1_rev	 =.	;
if	F11_1_rev	in	(66,77,88,99)	then	F11_1_rev	 =.	;
if	F12_1_rev	in	(66,77,88,99)	then	F12_1_rev	 =.	;
if	F13_1_rev	in	(66,77,88,99)	then	F13_1_rev	 =.	;
if	F14_1_rev	in	(66,77,88,99)	then	F14_1_rev	 =.	;
if	F15_1	in	(66,77,88,99)	then	F15_1	 =.	;
if	F16_1	in	(66,77,88,99)	then	F16_1	 =.	;
if	F17_1_rev	in	(66,77,88,99)	then	F17_1_rev	 =.	;
if	F18_1_rev	in	(66,77,88,99)	then	F18_1_rev	 =.	;
if	F19_1_rev	in	(66,77,88,99)	then	F19_1_rev	 =.	;
if	F20_1_rev	in	(66,77,88,99)	then	F20_1_rev	 =.	;
if	T01_1	in	(66,77,88,99)	then	T01_1	 =.	;
if	T02_1	in	(66,77,88,99)	then	T02_1	 =.	;
if	T03_1	in	(66,77,88,99)	then	T03_1	 =.	;
if	T04_1	in	(66,77,88,99)	then	T04_1	 =.	;
if	T05_1	in	(66,77,88,99)	then	T05_1	 =.	;
if	T06_1	in	(66,77,88,99)	then	T06_1	 =.	;
if	T07_1	in	(66,77,88,99)	then	T07_1	 =.	;
if	T08_1	in	(66,77,88,99)	then	T08_1	 =.	;
if	T09_1	in	(66,77,88,99)	then	T09_1	 =.	;
if	T10_1	in	(66,77,88,99)	then	T10_1	 =.	;
if	T11_1	in	(66,77,88,99)	then	T11_1	 =.	;
if	K01_1	in	(66,77,88,99)	then	K01_1	 =.	;
if	K02_1	in	(66,77,88,99)	then	K02_1	 =.	;
if	K03_1	in	(66,77,88,99)	then	K03_1	 =.	;
if	K04_1	in	(66,77,88,99)	then	K04_1	 =.	;
if	K05_1	in	(66,77,88,99)	then	K05_1	 =.	;
if	K06_1	in	(66,77,88,99)	then	K06_1	 =.	;
if	K07_1	in	(66,77,88,99)	then	K07_1	 =.	;
if	K08_1	in	(66,77,88,99)	then	K08_1	 =.	;
if	K09_1	in	(66,77,88,99)	then	K09_1	 =.	;
if	K10_1	in	(66,77,88,99)	then	K10_1	 =.	;
if	K12_1	in	(66,77,88,99)	then	K12_1	 =.	;
if	K13_1	in	(66,77,88,99)	then	K13_1	 =.	;
if	K14_1	in	(66,77,88,99)	then	K14_1	 =.	;
if	K15_1	in	(66,77,88,99)	then	K15_1	 =.	;
if	K16_1	in	(66,77,88,99)	then	K16_1	 =.	;
if	K17_1	in	(66,77,88,99)	then	K17_1	 =.	;
if	K18_1	in	(66,77,88,99)	then	K18_1	 =.	;
if	K19_1	in	(66,77,88,99)	then	K19_1	 =.	;
if	K20_1	in	(66,77,88,99)	then	K20_1	 =.	;
if	K21_1	in	(66,77,88,99)	then	K21_1	 =.	;
if	SC01_1	in	(66,77,88,99)	then	SC01_1	 =.	;
if	SC02_1	in	(66,77,88,99)	then	SC02_1	 =.	;
if	SC03_1	in	(66,77,88,99)	then	SC03_1	 =.	;
if	SC04_1	in	(66,77,88,99)	then	SC04_1	 =.	;
if	SC05_1	in	(66,77,88,99)	then	SC05_1	 =.	;
if	SC06_1	in	(66,77,88,99)	then	SC06_1	 =.	;
if	SC07_1	in	(66,77,88,99)	then	SC07_1	 =.	;
if	SC08_1	in	(66,77,88,99)	then	SC08_1	 =.	;
if	SC09_1	in	(66,77,88,99)	then	SC09_1	 =.	;
if	SC10_1	in	(66,77,88,99)	then	SC10_1	 =.	;
if	SC11_1	in	(66,77,88,99)	then	SC11_1	 =.	;
if	SC12_1	in	(66,77,88,99)	then	SC12_1	 =.	;
if	SC13_1	in	(66,77,88,99)	then	SC13_1	 =.	;
if	SC14_1	in	(66,77,88,99)	then	SC14_1	 =.	;
if	SC15_1	in	(66,77,88,99)	then	SC15_1	 =.	;
if	SC16_1	in	(66,77,88,99)	then	SC16_1	 =.	;
if	SC17_1	in	(66,77,88,99)	then	SC17_1	 =.	;
if	SC18_1	in	(66,77,88,99)	then	SC18_1	 =.	;
if	SC19_1	in	(66,77,88,99)	then	SC19_1	 =.	;
if	N01_1	in	(66,77,88,99)	then	N01_1	 =.	;
if	N03_1	in	(66,77,88,99)	then	N03_1	 =.	;
if	N05_1	in	(66,77,88,99)	then	N05_1	 =.	;
if	N07_1	in	(66,77,88,99)	then	N07_1	 =.	;
if	N09_1	in	(66,77,88,99)	then	N09_1	 =.	;
if	N11_1	in	(66,77,88,99)	then	N11_1	 =.	;
if	N13_1	in	(66,77,88,99)	then	N13_1	 =.	;
if	N14_1_rev	in	(66,77,88,99)	then	N14_1_rev	 =.	;
if	N15_1	in	(66,77,88,99)	then	N15_1	 =.	;
if	N16_1	in	(66,77,88,99)	then	N16_1	 =.	;
if	N17_1_rev	in	(66,77,88,99)	then	N17_1_rev	 =.	;
if	N18_1_rev	in	(66,77,88,99)	then	N18_1_rev	 =.	;
if	N19_1	in	(66,77,88,99)	then	N19_1	 =.	;
if	N20_1	in	(66,77,88,99)	then	N20_1	 =.	;
if	N21_1	in	(66,77,88,99)	then	N21_1	 =.	;
if	N22_1_rev	in	(66,77,88,99)	then	N22_1_rev	 =.	;
if	N23_1_rev	in	(66,77,88,99)	then	N23_1_rev	 =.	;
if	N25_1_rev	in	(66,77,88,99)	then	N25_1_rev	 =.	;
if	N26_1	in	(66,77,88,99)	then	N26_1	 =.	;
if	N27_1	in	(66,77,88,99)	then	N27_1	 =.	;
if	N28_1_rev	in	(66,77,88,99)	then	N28_1_rev	 =.	;
if	N29_1_rev	in	(66,77,88,99)	then	N29_1_rev	 =.	;
if	N30_1_rev	in	(66,77,88,99)	then	N30_1_rev	 =.	;
if	N31_1_rev	in	(66,77,88,99)	then	N31_1_rev	 =.	;
if	N32_1	in	(66,77,88,99)	then	N32_1	 =.	;
if	N33_1	in	(66,77,88,99)	then	N33_1	 =.	;
if	N34_1_rev	in	(66,77,88,99)	then	N34_1_rev	 =.	;
if	N35_1_rev	in	(66,77,88,99)	then	N35_1_rev	 =.	;
if	N36_1_rev	in	(66,77,88,99)	then	N36_1_rev	 =.	;
if	N37_1_rev	in	(66,77,88,99)	then	N37_1_rev	 =.	;
if	N38_1	in	(66,77,88,99)	then	N38_1	 =.	;
if	N39_1_rev	in	(66,77,88,99)	then	N39_1_rev	 =.	;
if	N40_1	in	(66,77,88,99)	then	N40_1	 =.	;
if	N41_1_rev	in	(66,77,88,99)	then	N41_1_rev	 =.	;
if	N42_1	in	(66,77,88,99)	then	N42_1	 =.	;
if	R01_1_rev	in	(66,77,88,99)	then	R01_1_rev	 =.	;
if	R02_1_rev	in	(66,77,88,99)	then	R02_1_rev	 =.	;
if	R03_1_rev	in	(66,77,88,99)	then	R03_1_rev	 =.	;
if	R04_1_rev	in	(66,77,88,99)	then	R04_1_rev	 =.	;
if	R05_1_rev	in	(66,77,88,99)	then	R05_1_rev	 =.	;
if	R06_1_rev	in	(66,77,88,99)	then	R06_1_rev	 =.	;
if	R07_1_rev	in	(66,77,88,99)	then	R07_1_rev	 =.	;
if	R08_1_rev	in	(66,77,88,99)	then	R08_1_rev	 =.	;
if	R09_1_rev	in	(66,77,88,99)	then	R09_1_rev	 =.	;
if	R10_1_rev	in	(66,77,88,99)	then	R10_1_rev	 =.	;
if	R11_1_rev	in	(66,77,88,99)	then	R11_1_rev	 =.	;
if	R12_1_rev	in	(66,77,88,99)	then	R12_1_rev	 =.	;
if	R13_1_rev	in	(66,77,88,99)	then	R13_1_rev	 =.	;
if	R14_1_rev	in	(66,77,88,99)	then	R14_1_rev	 =.	;
if	R15_1	in	(66,77,88,99)	then	R15_1	 =.	;
if	R16_1	in	(66,77,88,99)	then	R16_1	 =.	;
if	R17_1	in	(66,77,88,99)	then	R17_1	 =.	;
if	R18_1	in	(66,77,88,99)	then	R18_1	 =.	;
if	R19_1	in	(66,77,88,99)	then	R19_1	 =.	;
if	R20_1_rev	in	(66,77,88,99)	then	R20_1_rev	 =.	;
if	R21_1	in	(66,77,88,99)	then	R21_1	 =.	;
if	R22_1_rev	in	(66,77,88,99)	then	R22_1_rev	 =.	;
if	R23_1	in	(66,77,88,99)	then	R23_1	 =.	;
if	R24_1	in	(66,77,88,99)	then	R24_1	 =.	;
if	R25_1	in	(66,77,88,99)	then	R25_1	 =.	;
if	R26_1	in	(66,77,88,99)	then	R26_1	 =.	;
if	R27_1_rev	in	(66,77,88,99)	then	R27_1_rev	 =.	;
if	R28_1_rev	in	(66,77,88,99)	then	R28_1_rev	 =.	;
if	R29_1_rev	in	(66,77,88,99)	then	R29_1_rev	 =.	;
if	R30_1	in	(66,77,88,99)	then	R30_1	 =.	;
if	R31_1	in	(66,77,88,99)	then	R31_1	 =.	;
if	DM06_1	=	2	then	DM06_1	=	0;
if	DM05_1	=	2	then	DM05_1	=	0;
if	DM04_1	=	2	then	DM04_1	=	0;
if	DM03_1	=	2	then	DM03_1	=	0;
if	DM02_1	=	2	then	DM02_1	=	0;
if	DM01_1	=	2	then	DM01_1	=	0;
if	DM18_1	=	2	then	DM18_1	=	0;
if	DM17_1	=	2	then	DM17_1	=	0;
if	DM16_1	=	2	then	DM16_1	=	0;
if	DM15_1	=	2	then	DM15_1	=	0;
if	DM14_1	=	2	then	DM14_1	=	0;
if	DM13_1	=	2	then	DM13_1	=	0;
if	DM12_1	=	2	then	DM12_1	=	0;
if	DM11_1	=	2	then	DM11_1	=	0;
if	DM10_1	=	2	then	DM10_1	=	0;
if	DM09_1	=	2	then	DM09_1	=	0;
if	DM08_1	=	2	then	DM08_1	=	0;
if	L01_1	=	2	then	L01_1	=	0;
if	L04_1	=	2	then	L04_1	=	0;
if	L05_1	=	2	then	L05_1	=	0;
if	L06_1	=	2	then	L06_1	=	0;
if	L07_1_rev	=	2	then	L07_1_rev	=	0;
if	L08_1_rev	=	2	then	L08_1_rev	=	0;
if	L09_1	=	2	then	L09_1	=	0;
if	L10_1	=	2	then	L10_1	=	0;
if	L11_1	=	2	then	L11_1	=	0;
if	L12_1	=	2	then	L12_1	=	0;
if	CA01_1	=	2	then	CA01_1	=	0;
if	CA02_1	=	2	then	CA02_1	=	0;
if	CA03_1	=	2	then	CA03_1	=	0;
if	CA04_1	=	2	then	CA04_1	=	0;
if	CA05_1	=	2	then	CA05_1	=	0;
if	CA06_1	=	2	then	CA06_1	=	0;
if	CA07_1	=	2	then	CA07_1	=	0;
if	CA08_1	=	2	then	CA08_1	=	0;
if	CA09_1	=	2	then	CA09_1	=	0;
if	CA10_1	=	2	then	CA10_1	=	0;
if	CA11_1	=	2	then	CA11_1	=	0;
if	M07_1	=	2	then	M07_1	=	0;
if	M08_1	=	2	then	M08_1	=	0;
if	M09_1	=	2	then	M09_1	=	0;
if	M10_1	=	2	then	M10_1	=	0;
if	M11_1	=	2	then	M11_1	=	0;
if	M12_1	=	2	then	M12_1	=	0;
if	M17_1	=	2	then	M17_1	=	0;
if	M18_1	=	2	then	M18_1	=	0;
if	M19_1	=	2	then	M19_1	=	0;
if	M20_1	=	2	then	M20_1	=	0;
if	M21_1	=	2	then	M21_1	=	0;
if	M22_1	=	2	then	M22_1	=	0;
run;


* Scales should be averages;
* Indices should be sums;
data work.musescore;
set work.musesetmiss;
decmaking=(DM23_1+DM24_1+DM25_1+DM26_1+DM27_1+DM28_1+DM29_1+DM30_1+DM31_1+DM35_1+DM36_1+DM37_1+DM38_1+DM39_1+DM40_1+DM41_1+
DM42_1+DM43_1+DM44_1+DM45_1+DM46_1+DM47_1+DM48_1+DM49_1+DM51_1+DM52_1+DM53_1)/27;
leadership=(L13_1_rev+L14_1+L15_1+L16_1+L17_1_rev+L18_1+L19_1+L20_1+L21_1)/9;
collaction=(CA12_1+CA14_1+CA15_1+CA16_1+CA17_1+CA18_1+CA19_1+CA21_1+CA22_1+CA23_1+CA24_1)/11;
mobility=(M01_1+M02_1+M03_1+M04_1+M05_1+M06_1+M13_1+M14_1+M15_1+M16_1)/10;
bodinteg=(BI01_1+BI02_1+BI03_1+BI04_1+BI05_1_rev+BI06_1+BI07_1_rev+BI08_1_rev+BI09_1_rev+BI10_1_rev+BI11_1_rev+BI12_1_rev+BI13_1_rev+BI14_1+BI15_1+BI16_1+BI17_1+BI18_1_rev+BI19_1_rev+BI20_1_rev)/20;
health=(H01_1+H02_1+H03_1+H04_1+H05_1+H06_1+H07_1+H08_1+H09_1+H10_1+H11_1+H12_1+H13_1+H14_1+H15_1+H16_1+H17_1+H18_1+H19_1+H20_1+H22_1+H23_1+H24_1)/23;
safety=(S01_1+S02_1+S03_1+S08_1+S09_1+S10_1+S11_1+S12_1+S13_1+S14_1+S15_1+S04_1+S05_1+S06_1+S07_1+S16_1+S17_1+S18_1+S19_1+S20_1+S21_1+
S22_1+S23_1+S24_1+S25_1+S26_1+S27_1+S28_1+S29_1+S30_1+S31_1+S32_1+S33_1+S34_1_rev+S35_1_rev+S36_1_rev+S37_1)/37;
privacy=(P01_1+P02_1+P03_1+P04_1+P05_1+P06_1+P07_1+P08_1+P09_1+P10_1+P11_1+P12_1)/12;
critcon=(CC01_1+CC02_1+CC03_1+CC04_1+CC05_1+CC06_1+CC07_1+CC08_1+CC09_1+CC10_1+CC11_1+CC12_1+CC13_1_rev+CC14_1+CC15_1+CC16_1+CC17_1+
CC18_1_rev+CC19_1_rev+CC23_1+CC24_1_rev)/21;
finprasset=(F02_1+F01_1+F03_1+F04_1+F05_1+F06_1_rev+F07_1+F08_1+F10_1_rev+F11_1_rev+F12_1_rev+F13_1_rev+F14_1_rev+F15_1+
F16_1+F17_1_rev+F18_1_rev+F19_1_rev+F20_1_rev)/19;
time=(T01_1+T02_1+T03_1+T04_1+T05_1+T06_1+T07_1+T08_1+T09_1+T10_1+T11_1)/11;
knowledge=(K01_1+K02_1+K03_1+K04_1+K05_1+K06_1+K07_1+K08_1+K09_1+K10_1+K12_1+K13_1+K14_1+K15_1+K16_1+K17_1+K18_1+K19_1+K20_1+K21_1)/20;
scocap=(SC01_1+SC02_1+SC03_1+SC04_1+SC05_1+SC06_1+SC07_1+SC08_1+SC09_1+SC10_1+SC11_1+SC12_1+SC13_1+
SC14_1+SC15_1+SC16_1+SC17_1+SC18_1+SC19_1)/19;
norms=(N01_1+N03_1+N05_1+N07_1+N09_1+N11_1+N13_1+N14_1_rev+N15_1+N16_1+N17_1_rev+N18_1_rev+N19_1+N20_1+N21_1+N22_1_rev+N23_1_rev+N25_1_rev+
N26_1+N27_1+N28_1_rev+N29_1_rev+N30_1_rev+N31_1_rev+N32_1+N33_1+N34_1_rev+N35_1_rev+N36_1_rev+N37_1_rev+N38_1+N39_1_rev+N40_1+N41_1_rev+N42_1)/35;
relations=(R01_1_rev+R02_1_rev+R03_1_rev+R04_1_rev+R05_1_rev+R06_1_rev+R07_1_rev+R08_1_rev+R09_1_rev+R10_1_rev+R11_1_rev+R12_1_rev+R13_1_rev+
R14_1_rev+R15_1+R16_1+R17_1+R18_1+R19_1+R20_1_rev+R21_1+R22_1_rev+R23_1+R24_1+R25_1+R26_1+R27_1_rev+R28_1_rev+R29_1_rev+R30_1+R31_1)/31;
*decmaking_index=(DM06_1+DM05_1+DM04_1+DM03_1+DM02_1+DM01_1+DM18_1+DM17_1+DM16_1+DM15_1+DM14_1+DM13_1+DM12_1+DM11_1+DM10_1+DM09_1+DM08_1);
leadership_index=(L01_1+L04_1+L05_1+L06_1+L07_1_rev+L08_1_rev+L09_1+L10_1+L11_1+L12_1);
collaction_index=(CA01_1+CA02_1+CA03_1+CA04_1+CA05_1+CA06_1+CA07_1+CA08_1+CA09_1+CA10_1+CA11_1);
mobility_index=(M07_1+M08_1+M09_1+M10_1+M11_1+M12_1+M17_1+M18_1+M19_1+M20_1+M21_1+M22_1);
run;

/*NOTE: The data set work.musescore should have 2174 observations and 884 variables.*/


/*****************************************************/
/*	SPLIT INTO FORMATTED INITIAL AND RE-TEST DATA	 */
/*****************************************************/
* Initial data;
data work.muset1;
set work.musescore;
if SCR04=1;
run;
/*NOTE: The data set work.muset1 should have 2020 observations and 884 variables.*/

* Retest data;
data work.muset2;
set work.musescore;
if SCR04=2;
run;
/*NOTE: The data set work.muset2 should have 154 observations and 884 variables.*/


/****************************************/
/*		STANDARDIZE WEALTH INDEX		*/
/****************************************/
data work.muset1ST;
set work.muset1;
WI_Sum_I_std=WI_Sum_I;
WI_Sum_U_std=WI_Sum_U;
run;
* Standardize WI;
proc standard data=work.muset1ST mean=0 std=1 vardef=n out=work.muset1std; 
var WI_Sum_I_std WI_Sum_U_std;
run;
* Create quintiles - N in each quintile;
proc rank data=work.muset1std out=work.muset1QuintI groups=5;
var WI_Sum_I_std;
ranks WI_Quint_I;
run;
proc rank data=work.muset1QuintI out=work.muset1QuintIU groups=5;
var WI_Sum_U_std;
ranks WI_Quint_U;
run;
data work.muset1QuintIU;
set work.muset1QuintIU;
format WI_Quint_U fquint.;
format WI_Quint_I fquint.;
label WI_Quint_U='Standardized Wealth Quntiles for Uganda' 
	  WI_Quint_I='Standardized Wealth Quntiles for India';
run;
/*proc freq data=work.muset1QuintIU;
tables WI_Quint_I WI_Quint_U;
run;*/
/*NOTE: The data set work.muset1QuintIU should have 2174 observations and 888 variables.*/

/*****************************************************************/
/* 		SAVE CLEAN DATA SET FOR DESCRIPTIVE ANALYSIS             */
/*****************************************************************/
*Change pathway as needed;
LIBNAME M 'H:\Muse\Data\Cleaned_Data';

* Final initial data collection;
data M.muse_initial_data;
set work.muset1QuintIU;
run;

* Final re-test data collection;
data M.muse_restest_data;
set work.muset2;
run;
