sz = [9 3];
varTypes = {'string', 'double', 'double'};
varNames = {'Words','Spam','Non-spam'};
a6Table = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames)
a6Table(1,:) = {"Anti-aging",0.00062,3.5e-08}
a6Table(2,:) = {"Customers",0.005,0.0001}
a6Table(3,:) = {"Fun",0.00015,0.0007}
a6Table(4,:) = {"Groningen",1e-05,0.001}
a6Table(5,:) = {"Lecture",1.5e-05,0.0008}
a6Table(6,:) = {"Money",0.002,0.0005}
a6Table(7,:) = {"Vacation",0.00025,0.00014}
a6Table(8,:) = {"Viagra",0.001,3e-07}
a6Table(9,:) = {"Watches",0.0003,4e-06}

priors = [0.9, 0.1]

a6q1spam=a6Table(2,2).Variables * a6Table(9,2).Variables * priors(1);
a6q1nonspam=a6Table(2,3).Variables * a6Table(9,3).Variables * priors(2);
a6q1ratio = a6q1spam/a6q1nonspam
a6q5spam=a6Table(3,2).Variables * a6Table(7,2).Variables * priors(1);
a6q5nonspam=a6Table(3,3).Variables * a6Table(7,3).Variables * priors(2);
a6q5ratio = a6q1spam/a6q1nonspam

%Note: If the spam probability > nonspam probability, it's spam