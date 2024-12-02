data FrmResp;
infile "\\apporto.com\dfs\CLT\Users\vnikolo1_clt\Desktop\FrmResp.txt" DLM='09'X FIRSTOBS=2;
input $ AvgSleep $ StudyHours $ RecHours $ WorkBinary $ WorkHours $;
/*Print data, it's a newer TXT file I'm pulling data from*/
proc print data=FrmResp;
run;

/*Trying to make a general linear model, might have to turn the AvgSleep variable into dummy variables to make it work*/
proc glm data=FrmResp;
Class AvgSleep StudyHours RecHours WorkBinary WorkHours;
model AvgSleep = StudyHours RecHours WorkBinary WorkHours;
run;
