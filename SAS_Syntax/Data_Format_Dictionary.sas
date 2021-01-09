
*************************************************************************************************************************
Value Label Library
*************************************************************************************************************************;
PROC FORMAT ;
COMMENT Data Item Name: multiple, SD11, SD12, SU12, SU13, SG02, SG02a;
VALUE fyn
1='Yes'
2='No'
66='No Response'
77='Not Applicable'
88='Do Not Know'
99='Missing';
COMMENT Data Item Name: multiple;
VALUE ftf
1='Selected'
0='Not Selected'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SCR02;
VALUE fcountry
1='Uganda'
2='India'
3='Bangladesh'
4='Zambia'
5='Senegal'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SCR07U;
VALUE fluganda
1='Luganda'
2='English'
3='Neither Luganda nor English'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D03; 
VALUE feducation
1='Less than primary education'
2='Primary education'
3='Lower secondary education'
4='Upper secondary education'
5='Short-cycle tertiary education'
6='Bachelors or equivalent level'
7='Masters or equivalent level'
8='Doctoral or equivalent level'
9='Not elsewhere classfied'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D03noschool; 
VALUE fnoschool
1='Less than primary education'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D04, D05, D06;
VALUE ffrequency 	
1 = 'At least once a week'
2 = 'Less than once a week'
3 = 'Not at all'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D08;
VALUE fincome 
1 = 'Yes, earn an income outside the home'
2 = 'Yes, earn an income inside the home'
3 = 'Yes, earn an income both inside and outside the home'
4 = 'No, do not earn an income'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D10;
VALUE fmaritalstatus	
1 = 'Single, never married'
2 = 'Married'
3 = 'Unmarried, living with partner'
4 = 'Divorced/Separated'
5 = 'Widowed'
99='Missing'
88='Other'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D16;
VALUE freligion	
1 = 'Christian (Catholic)'
2 = 'Christian (Protestant)'
3 = 'Muslim'
4 = 'Hindu'
5 = 'Buddhist'
6 = 'Jewish'
7 = 'Other'
8 = 'None'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D17I;
VALUE fcaste
1 = 'Scheduled Caste (SC)'
2 = 'Other Backward Caste (OBC)'
3 = 'Brahmin'
4 = 'General Caste (Excluding OBC and Brahmin)'
5 = 'Scheduled Tribe (ST)'
6 = 'Not applicable'
88 = 'Do not know'
99='Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: D17U;
VALUE fethnicgroup
1 = 'Acholi'
2 = 'Alur'
3 = 'Baganda'
4 = 'Bagisu'
5 = 'Bakiga'
6 = 'Bakonzo'
7 = 'Banyankore'
8 = 'Banyoro'
9 = 'Basoga'
10 = 'Batoro'
11 = 'Iteso'
12 = 'Lango'
13 = 'Lugbara'
14 = 'Nubian'
99 = 'Other'
88='Do Not Know'
66='No Response'
77='Not Applicable';	
COMMENT Data Item Name: D18;
VALUE fbirthplace
1 = 'In this city'
2 = 'Elsewhere in this country'
3 = 'Outside this country'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';	
COMMENT Data Item Name: D21;
VALUE flikelylikert
1 = 'Very likely'
2 = 'Somewhat likely'
3 = 'Somewhat unlikely'
4 = 'Not likely at all'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SD01, SU02;
VALUE fsanlocation
1 = 'In own dwelling'
2 = 'In own yard/plot'
3 = 'Elsewhere'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SD01a, SU02a, SU21, SD20;
VALUE fsantype
1 = 'Flush toilet'
2 = 'Pit latrine'
3 = 'Composting toilet'
4 = 'Bucket/hanging toilet/flying toilet'
5 = 'No facility/bush/field'
99 = 'Other'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SD02, SU03;
VALUE fshareyn
1 = 'Yes'
2 = 'No'
3 = 'I use a private stall/stance in a shared latrine block'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';COMMENT Data Item Name: SD03, SU04;
VALUE fshare
1 = 'Shared with known households (not public)'
2 = 'Shared with general public'
3 = 'I use a private stall/stance in a shared latrine block'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: MH01(MC01); 
VALUE fmenstruate
1 = 'Yes, regular'
2 = 'Yes, but irregular'
3 = 'No'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: MH02; 
VALUE fmenmat
1 = 'Reusable cloth'
2 = 'Disposable pad'
3 = 'Both pad and cloth'
4 = 'Nothing'
88 = 'Other'
99='Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: MH03, MH04; 
VALUE fmenchange
1 = 'In private toilet inside my house'
2 = 'In bathroom inside my house'
3 = 'In other room inside my house'
4 = 'In private toilet outside my house'
5 = 'In shared or public toilet'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: MH05; 
VALUE fmendisp
1 = 'Flush down the toilet or put in pit latrine'
2 = 'In a rubbish bin inside or outside the house'
3 = 'Thrown in open drain'
4 = 'Thrown somewhere else outside in the open'
5 = 'Burn it'
6 = 'Bury outside'
7 = 'Do not dispose'
77='Not Applicable'
88='Do Not Know'
66='No Response'
99='Missing';
COMMENT Data Item Name: multiple, NV01, NV02, NV03, NV04; 
VALUE fagreelikert
1 = 'Strongly disagree'
2 = 'Disagree'
3 = 'Agree'
4 = 'Strongly agree'
99 ='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: L02_1(L02); 
VALUE fsangroup
1 = 'Constructing latrines/toilets'
2 = 'Repairing/improving latrines/toilets'
3 = 'Maintaining, such as emptying latrines/toilets'
4 = 'Cleaning latrines/toilets'
5 = 'Educating on health benefits'
6 = 'Promoting use of latrines/toilets'
99 = 'Other'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: L03_1(L03), CA02a_1 (CA02a), CA03a_1 (CA03a), CA04a_1 (CA04a), CA05a_1 (CA05a), CA06a_1 (CA06a), CA07a_1 (CA07a)
CA08a_1 (CA08a), CA09a_1 (CA09a), CA010a_1 (CA010a), CA011a_1 (CA011a); 
VALUE fgroupmembers
1 = 'Men and women'
2 = 'Women only'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: M01_1 (M01), M02_1 (M02), M03_1 (M03), M04_1 (M04), M05_1 (M05), M06_1 (M06), M13_1 (M13), M14_1 (M14),
M15_1 (M15), M16_1 (M16); 
VALUE fmobility
1 = 'Alone without telling anyone'
2 = 'Alone if I tell someone'
3 = 'Alone with permission'
4 = 'Only with accompaniment'
5 = 'Not at all'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: multiple; 
VALUE ffreqlikert
1 = 'Never'
2 = 'Sometimes'
3 = 'Often'
4 = 'Always'
99='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SD04, SU05; 
VALUE fhouseholds
0 = '0 households'
1 = '1 household'
2 = '2 households'
3 = '3 households'
4 = '4 households'
5 = '5 households'
6 = '6 households'
7 = '7 households'
8 = '8 households'
9 = '9 households'
10 = '10 households'
99 ='Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: SD09, SU10; 
VALUE fbringwater
1 = 'Yes'
2 = 'No, water is available at this location'
3 = 'No, water is not needed'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DMV01, DMV02; 
VALUE fcomfortlikert
1 = 'No, not at all comfortable'
2 = 'Yes, but with a great deal of difficulty'
3 = 'Yes, but with a little difficulty'
4 = 'Yes, fairly comfortable'
5 = 'Yes, very comfortable'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DMV03, DMV04, DMV05; 
VALUE fpermit
1 = 'Respondent'
2 = 'Husband'
3 = 'Respondent and husband jointly'
4 = 'Someone else'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: LV01, LV02, LV03, CAV01, CAV02, CAV03, CAV04, CAV05; 
VALUE fagreeSlikertmid
1 = 'Strongly disagree'
2 = 'Disagree'
3 = 'Neither disagree nor agree'
4 = 'Agree'
5 = 'Strongly agree'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: MV01, MV02, MV03; 
VALUE fpermityn
0 = 'No'
1 = 'Must inform'
2 = 'Yes'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: HV01; 
VALUE fexlikert
1 = 'Excellent'
2 = 'Very good'
3 = 'Good'
4 = 'Fair'
5 = 'Poor'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: HV02, HV03, HV04, HV05, HV06; 
VALUE ftime
1 = 'All of the time'
2 = 'Most of the time'
3 = 'More than half of the time'
4 = 'Less than half of the time'
5 = 'Some of the time'
6 = 'At no time'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: HV07, HV08, HV09, HV10; 
VALUE fmh
1 = 'Not at all'
2 = 'Several days'
3 = 'More than half the days'
4 = 'Nearly every day'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: CCV01, CCV02, CCV03, CCV04, CCV05, CCV06; 
VALUE ftrue
1 = 'Not at all true'
2 = 'Hardly true'
3 = 'Moderately true'
4 = 'Exactly true'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: FV01; 
VALUE fmoney
1 = 'You have your own money so you can usually buy what you need'
2 = 'You occasionally have to get the money from your husband or someone else in the household'
3 =  'You always have to get the money from your husband or someone else in the household'
77 = 'Not applicable'
88='Do Not Know'
66='No Response'
99 = 'Missing';
COMMENT Data Item Name: SCV01, SCV02, SCV03, SCV04, SCV05, SCV06, SCV07, SCV08; 
VALUE fagreeClikertmid
1 = 'Completely disagree'
2 = 'Mildly disagree'
3 = 'Neither agree nor disagree'
4 = 'Mildly agree'
5 = 'Completely agree'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: RV01, RV02, RV03; 
VALUE ffreqlikertmid
1 = 'Not at all'
2 = 'A little'
3 = 'Somewhat'
4 = 'Quite a bit'
5 = 'A lot'
99 = 'Missing'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE01; 
VALUE fhome
1 = 'Single family home'
2 = 'Apartment'
3 = 'Compound with shared living spaces'
99 = 'Other'
88='Do Not Know'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE02I; 
VALUE ffloorI
1 = 'Mud/clay/earth'
2 = 'Sand'
3 = 'Dung'
4 = 'Raw wood planks'
5 = 'Palm/bamboo'
6 = 'Brick'
7 = 'Stone'
8 = 'Parquet or polished wood'
9 = 'Vinyl or asphalt'
10 = 'Ceramic tiles'
11 = 'Cement'
12 = 'Carpet'
13 = 'Polished stone/marble/granite'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE02U; 
VALUE ffloorU
1 = 'Earth/Sand'
2 = 'Dung'
3 = 'Wood planks'
4 = 'Palm/bamboo'
5 = 'Parquet or polished wood'
6 = 'Concrete'
7 = 'Cement tiles'
8 = 'Cement screed'
9 = 'Carpet'
10 = 'Stones'
11 = 'Bricks'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE03I; 
VALUE froofI
1 = 'No roof'
2 = 'Thatch/palm leaf/reed/grass'
3 = 'Mud'
4 = 'Sod/mud and grass mixture'
5 = 'Plastic/polythene sheeting'
6 = 'Rustic mat'
7 = 'Palm/bamboo'
8 = 'Raw wood planks/timber'
9 = 'Unburnt brick'
10 = 'Loosely packed stone'
11 = 'Metal/gi'
12 = 'Wood'
13 = 'Calamine/cement fiber'
14 = 'Asbestos sheets'
15 = 'RCC/RBC/Cement/Concrete'
16 = 'Roofing shingles'
17 = 'Tiles'
18 = 'Slate'
19 = 'Burnt brick'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE03U; 
VALUE froofU
1 = 'No roof'
2 = 'Thatch/palm leaf'
3 = 'Mud'
4 = 'Rustic mat'
5 = 'Tins'
6 = 'Wood planks'
7 = 'Cardboard'
8 = 'Tarpulin'
9 = 'Iron sheets'
10 = 'Wood'
11 = 'Asbestos'
12 = 'Tiles'
13 = 'Concrete'
14 = 'Roofing shingles'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
COMMENT Data Item Name: DE04I; 
VALUE fwallI
1 = 'No walls'
2 = 'Cane/palm/trunks/bamboo'
3 = 'Mud'
4 = 'Grass/reeds/thatch'
5 = 'Bamboo with mud'
6 = 'Stone with mud'
7 = 'Plywood'
8 = 'Cardboard'
9 = 'Raw wood/reused wood'
10 = 'Cement/concrete'
11 = 'Stone with lime/cement'
12 = 'Burnt bricks'
13 = 'Cement blocks'
14 = 'Wood planks/shingles'
15 = 'Gi/metal/asbestos sheets'
88 = 'Other'
66='No Response'
99 = 'Missing'
77='Not Applicable';
COMMENT Data Item Name: DE04U; 
VALUE fwallU
1 = 'No walls'
2 = 'Thatched/straw'
3 = 'Dirt'
4 = 'Poles with mud'
5 = 'Stone with mud'
6 = 'Unburnt bricks with mud'
7 = 'Plywood'
8 = 'Cardboard'
9 = 'Reused wood'
10 = 'Unburnt bricks with plaster'
11 = 'Burnt bricks with mud'
12 = 'Cement'
13 = 'Stone with lime/cement'
14 = 'Burnt bricks with cement'
15 = 'Cement blocks'
16 = 'Unburnt bricks with cement'
17 = 'Wood planks/shingles'
88 = 'Other'
99 = 'Missing'
66='No Response'
77='Not Applicable';
RUN;
