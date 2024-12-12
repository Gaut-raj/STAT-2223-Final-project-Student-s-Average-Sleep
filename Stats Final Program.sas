/* Step 1: Import the cleaned dataset */
data FrmResp_Cleaned;
infile "C:\Users\carso\Documents\Dataset.Final.Stats.Cleaned.csv" dsd firstobs=2 missover;
input SleepHours StudyHours RecHours WorkBinary WorkHours;
run;

/* Step 2: Inspect the data */
proc print data=FrmResp_Cleaned(obs=10);
title "First 10 Observations of the Cleaned Dataset";
run;

/* Step 3: Summary statistics */
proc means data=FrmResp_Cleaned n mean std min max;
var SleepHours StudyHours RecHours WorkBinary WorkHours;
title "Summary Statistics of the Cleaned Dataset";
run;

/* Step 4: Perform multilinear regression */
proc glm data=FrmResp_Cleaned;
class WorkBinary; /* Specify categorical variables */
model SleepHours = StudyHours RecHours WorkBinary WorkHours / solution;
title "Multilinear Regression Model";
run;

/* Step 5: Refine the model by removing insignificant predictors */
proc glm data=FrmResp_Cleaned;
class WorkBinary;
model SleepHours = StudyHours / solution;
title "Refined Regression Model with Significant Predictor";
run;

/* Step 6: Save the final cleaned dataset */
proc export data=FrmResp_Cleaned
outfile="C:\Users\carso\Documents\Dataset.Final.Stats.Cleaned.Refined.csv"
dbms=csv replace;
title "Exporting Final Cleaned Dataset";
run;
