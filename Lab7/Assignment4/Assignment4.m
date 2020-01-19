load('provinces.mat')
%Question 1
%Answer: z= (x-miyu)/sigma, also known as (x-sample mean)/sample standard
%deviation.
%Question 2
%Answer: See bellow
X = importdata('provinces.mat');%1
X = zscore(X);%2
Y = pdist(X,'Euclidean');%3
D = squareform(Y);%4
%Question 3
%Answer:Zeeland, because according to the table, the 10th provice is
%Zeeland.
%Question 4
%Answer: a4q4
a4q4=D(10,9);
%Question 5
%Answer: South Holland, because it is the one with the highest value.
%Question 6
%Answer: a4q6
a4q6=D(9,1);