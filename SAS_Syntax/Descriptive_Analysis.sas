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

*Load Data and format;
*Change pathway as needed;

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

%include 'H:\Muse\Format\Format - MUSE.sas';

LIBNAME M 'H:\Muse\Data\Cleaned_Data';



/**********************************************************************/
/*  						LOAD FORMATED DATA						  */
/**********************************************************************/
* Final initial data collection;
data work.muse;
set M.muse_initial_data;
run;
/*NOTE: The data set work.muserev should have 2020 observations and 887 variables.*/


/************************************************/
/*				SUBSET DATA	BY COUNTRY		 	*/
/************************************************/
data work.museUGANDA; *Uganda only;
set work.muse;
if SCR02=1;
run;
/*NOTE: The data set work.museUGANDA should have 1024 observations and 887 variables.*/
data work.museINDIA; *India only;
set work.muse;
if SCR02=2;
run;
/*NOTE: The data set work.museINDIA should have 996 observations and 887 variables.*/


/********************************************************/
/*					 LOAD SAS MACROS					*/
/********************************************************/
%include "H:\Muse\Macros\DESCRIPTIVE V15.sas";
%include "H:\Muse\Macros\UNI_NUM V9.sas";
%include "H:\Muse\Macros\UNI_CAT V30.sas"; 


/********************************************/
/*		 SET UP DIRECTORY FOR TABLES 	    */
/********************************************/
%let dir = H:\Muse\Tables_Figures\; *set directory to location where macro-generated tables will output;


/****************************************************************************/
/*					 		DESCRIPTIVE STATISTICS							*/
/****************************************************************************/
* TABLE 1 DEMOGRAPHICS OF PARTICIPANTS;
%let c_var = age_cat D10 childage_cat;
%let n_var = D12;
ods listing close;
TITLE 'Table 1-1 Demographics of Participants - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
	 NLIST = &n_var,
     OUTPATH= &dir, 
     FNAME= Table 1-1 Demographics of Participants - Ugandaa,
     DEBUG=F); 
TITLE;
TITLE 'Table 1-2 Demographics of Participants - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
	 NLIST = &n_var,
     OUTPATH= &dir, 
     FNAME= Table 1-2 Demographics of Participants - India,
     DEBUG=F); 
TITLE;

* TABLE 2 DEMOGRAPHICS OF PARTICIPANTS CONTINUED;
%let c_var = religion_cat D18 lengthofresidence_cat;
%let n_var = D09;
ods listing close;
TITLE 'Table 2-1 Demographics of Participants - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
	 NLIST = &n_var,
     OUTPATH= &dir, 
     FNAME= Table 2-1 Demographics of Participants - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Table 2-2 Demographics of Participants - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
	 NLIST = &n_var,
     OUTPATH= &dir, 
     FNAME= Table 2-2 Demographics of Participants - India,
     DEBUG=F); 
TITLE;

* TABLE 3 DEMOGRAPHICS OF PARTICIPANTS CONTINUED;
%let c_var = edu_cat D04 D05 D06 D07 D08 WI_Quint_U;
ods listing close;
TITLE 'Table 3-1 Demographics of Participants - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 3-1 Demographics of Participants - Uganda,
     DEBUG=F); 
TITLE;
%let c_var = edu_cat D04 D05 D06 D07 D08 WI_Quint_I;
TITLE 'Table 3-2 Demographics of Participants - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 3-2 Demographics of Participants - India,
     DEBUG=F); 
TITLE;


* FIGURE 1 - TABLE TO BUILD HOUSING TYPE BAR GRAPH;
%let c_var = DE01;
ods listing close;
TITLE 'Figure 1-1 - Table to Build Housing Type Bar Graph - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 1-1 - Table to Build Housing Type Bar Graph - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 1-2 - Table to Build Housing Type Bar Graph - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 1-2 - Table to Build Housing Type Bar Graph - India,
     DEBUG=F); 
TITLE;

* TABLE 4 - HOUSING MATERIALS;
%let c_var = floormatU_cat roofmatU_cat wallmatU_cat;
ods listing close;
TITLE 'Table 4-1 - Housing Materials - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 4-1 - Housing Materials - Uganda,
     DEBUG=F); 
TITLE;
%let c_var = floormatI_cat roofmatI_cat wallmatI_cat;
TITLE 'Table 4-2 - Housing Materials - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 4-2 - Housing Materials - India,
     DEBUG=F); 
TITLE;


* FIGURE 2 - TABLE TO BUILD LENGTH OF TIME SPENT COLLECTING WATER BAR GRAPH;
%let c_var = W02_cat;
ods listing close;
TITLE 'Figure 2-1 - Table to Build Length of Time Spent Collecting War Bar Graph - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 2-1 - Table to Build Length of Time Spent Collecting War Bar Graph - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 2-2 - Table to Build Length of Time Spent Collecting War Bar Graph - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 2-2 - Table to Build Length of Time Spent Collecting War Bar Graph - India,
     DEBUG=F); 
TITLE;

* FIGURE 3 - TABLE TO BUILD TIMES PER WEEK COLLECTING WATER BAR GRAPH;
%let c_var = W03_cat;
ods listing close;
TITLE 'Figure 3-1 - Table to Build Times per Week Collecting Water Bar Graph - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 3-1 - Table to Build Times per Week Collecting Water Bar Graph - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 3-2 - Table to Build Times per Week Collecting Water Bar Graph - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 3-2 - Table to Build Times per Week Collecting Water Bar Graph - India,
     DEBUG=F); 
TITLE;


* FIGURE 4 - TABLE TO BUILD LOCATION OF SANITATION FACILITY MOST COMMONLY USED BAR GRAPH;
* NOTE: If respondent indicated most common place for urination was same as that for defection 
then logic pattern skipped all urination questions, so large number of N/A responses;
%let c_var = SD01 SD19 SU02 SU20;
ods listing close;
TITLE 'Figure 4-1 - Table to Build Location of Sanitation Facility Most Commonly Used - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 4-1 - Table to Build Location of Sanitation Facility Most Commonly Used - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 4-2 - Table to Build Location of Sanitation Facility Most Commonly Used - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 4-2 - Table to Build Location of Sanitation Facility Most Commonly Used - India,
     DEBUG=F); 
TITLE;


* FIGURE 5 - TABLE TO BUILD TYPE OF SANITATION FACILITY MOST COMMONLY USED BAR GRAPH;
/* NOTES: 
1. If respondent indicated most common place for urination during the day was same as that for defection then logic pattern skipped urination during day question.
2. If respondent indicated said common place for urination at night was same as during day then logic pattern skipped urination during night question.
3. If respondent indicated most common place for defecation at night was same as during day was same as that for defection then logic pattern skipped defecation during night question.
Therefore, large number of N/A responses for SU02a, SU21, and SD20*/
%let c_var = SU02a SU21 SD01a SD20;
ods listing close;
TITLE 'Figure 5-1 - Table to Type Location of Sanitation Facility Most Commonly Used - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 5-1 - Table to Build Type of Sanitation Facility Most Commonly Used - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 5-2 - Table to Build Type of Sanitation Facility Most Commonly Used - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 5-2 - Table to Build Type of Sanitation Facility Most Commonly Used - India,
     DEBUG=F); 
TITLE;



* FIGURE 6 - TABLE TO BUILD TYPE OF SANITATION FACILITY (PRIVACY) MOST COMMONLY USED BAR GRAPH;
/* NOTES: 
1. If respondent indicated most common place for urination during the day was same as that for defection then logic pattern skipped urination privacy questions.
Therefore, large number of N/A responses for SU03 and SU04
2. Unsure what '3' corresponds to for SD02 and SU03 - not in survey*/
%let c_var = SD02 SD03 SU21 SU03 SU04;
ods listing close;
TITLE 'Figure 6-1 - Table to Type Location of Sanitation Facility (Privacy) Most Commonly Used - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 6-1 - Table to Build Type of Sanitation Facility (Privacy) Most Commonly Used - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Figure 6-2 - Table to Build Type of Sanitation Facility (Privacy) Most Commonly Used - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Figure 6-2 - Table to Build Type of Sanitation Facility (Privacy) Most Commonly Used - India,
     DEBUG=F); 
TITLE;



* TABLE 5 - DEFECATION;
%let c_var = SD04 timewalkdef SD08 SD09 SD10 SD11 SD12 SD13 SD14 SD15 SD16 SD17 SD18;
ods listing close;
TITLE 'Table 5-1 - Defecation - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 5-1 - Defecation - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Table 5-2 - Defecation - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
	 OUTPATH= &dir, 
     FNAME= Table 5-2 - Defecation - India,
     DEBUG=F); 
TITLE;


* TABLE 6 - URINATION;
%let c_var = SU05 SU06 timewalkur SU09 SU10 SU11 SU12 SU13 SU14 SU15 SU16 SU17 SU18 SU19 ;
ods listing close;
TITLE 'Table 6-1 - Urination - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 6-1 - Urination - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Table 6-2 - Urination - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 6-2 - Urination - India,
     DEBUG=F); 
TITLE;


* TABLE 7 - MENSTRUATION;
%let c_var = MH02 MH03 MH04 MH05;
ods listing close;
TITLE 'Table 7-1 - Menstruation - Uganda';
%DESCRIPTIVE(DATASET=work.museUGANDA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 7-1 - Menstruation - Uganda,
     DEBUG=F); 
TITLE;
TITLE 'Table 7-2 - Menstruation - India';
%DESCRIPTIVE(DATASET=work.museINDIA, 
     CLIST = &c_var,
     OUTPATH= &dir, 
     FNAME= Table 7-2 - Menstruation - India,
     DEBUG=F); 
TITLE;


/* WATER COLLECTION QUESTIONS
Percentage of respondents who have to collect water (by country)
Mean (and SD) time to collect water
Mean (and SD) frequency of water collection
Percentage of respondents who have to collect water
Percentage of respondents who are unable to access their preferred water source due to cost */
