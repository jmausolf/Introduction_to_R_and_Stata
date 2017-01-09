*##########################################*
*##                                      ##*
*##           Joshua G. Mausolf          ##*
*##        Department of Sociology       ##*
*##         University of Chicago        ##*
*##                                      ##*
*##########################################*


//Load Your Data By Double Clicking It
use "gss_2006_example.dta", clear


*------------------------------------------*
// Examine the Data
*------------------------------------------*

//Describe All Data
describe

//Codebook All Data
codebook

//Summarize All Data
sum

//Summarize All Data with Detail
sum, detail

//List Data in First 10 Rows
list in 1/10

//List All Value Labels
label dir


*------------------------------------------*
// Cross Tabs
*------------------------------------------*

//Example - 1
tab sex marital, col

//Example - 2
tab wrkwayup race, col

//Example - 3
//Same as Example 2, but Igore DK and Other
tab wrkwayup race if wrkwayup<=5 & race<=2, col


*------------------------------------------*
// Statistical Tests 
*------------------------------------------*

//Chi 2
//For Two Categorical Variables, Do A Chi2 Test
tab wrkwayup race if wrkwayup<=5 & race<=2, col chi

//What If We Only Consider Those < 30 Years Old
tab wrkwayup race if wrkwayup<=5 & race<=2 & age<30, col chi

//Or Those Older Than 50
tab wrkwayup race if wrkwayup<=5 & race<=2 & age>50, col chi


*------------------------------------------*
// Manipulate Data 
*------------------------------------------*

//GSS Codebook for Reference
//http://www.thearda.com/archive/files/Codebooks/GSS2006_CB.asp

//Start
tab wrkwayup

//Make New Variable
gen wrkwayup3 = wrkwayup
tab wrkwayup3

//Label Variable
label var wrkwayup3 "Blacks should overcome prejudice without favors"
tab wrkwayup3


//Apply Existing Value Label
label val wrkwayup3 wrkwayup
tab wrkwayup3


//Recode Variable Into 3 Groups
recode wrkwayup3 (1/2=1) (3=2) (4/5=3)
tab wrkwayup3

//Define New Label
la de wrkwayup3lab 1 "Agree" 2 "Neutral" 3 "Disagree" 8 "Don't know"
la val wrkwayup3 wrkwayup3lab
tab wrkwayup3


*------------------------------------------*
// Graphs
*------------------------------------------*

//Very Simple Box Graph
graph box educ if educ<98, over(race) yline(12) 

//Simple Scatter with Trend Lines
twoway (scatter age educ if educ<98) (lfit age educ if educ<98)


//Histogram - Basic
hist wrkwayup3, by(race)

