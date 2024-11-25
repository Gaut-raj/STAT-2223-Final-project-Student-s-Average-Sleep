/*Import the Dataset */
DATA AvgSleep;
    INFILE '"\\apporto.com\dfs\CLT\Users\dgovind1_clt\Desktop/AvgSleep.txt" ' DELIMITER='09'x DSD FIRSTOBS=2;
    INPUT
        Quan_Sleep $ 
        Sleep_Hours $ 
        Quan_Study $
        Study_Hours $
        Quan_Rec $
        Rec_Hours $
        Work_Binary $
        Work_YesNo $ 
        Quan_Work $
        Work_Hours $;
RUN;

/* Print the Dataset */
PROC PRINT DATA=AvgSleep;
    TITLE 'Avg Sleep Dataset';
RUN;
