%Execute before anything else:
clear all;
load lab3_2.mat;
data = lab3_2;
%Question 1
%{
Answer:
The correct order is: 3,1,4,10,8,6,11.
If you want to know why, check KNN.m and read the comments.
%}
%Question 2
%{
Upload the archive that contains all of the functions. I think that's what
was requested. Not sure. Please correct me if I'm wrong.
%}
%Question 3
%{
Answer:
The correct order is:
C. K=1
B. K=3
A. K=5
D. K=7
Run following code one by one if you want to confirm.
%}
knn_wrp(1,data,2);
knn_wrp(3,data,2);
knn_wrp(5,data,2);
knn_wrp(7,data,2);
%Question 4
%{
Answer:
0.2350
%}
q4errorRate = LOOCV(3,data,2);
%Question 5
%{
Answer:
0.2500
%}
q5errorRate = LOOCV(17,data,2);
%Question 6
%{
Answer:
Attach q6plot.fig;
If you want to generate the plot again, use the following code.
%}
x = 1:20;
y = []
for i = 1:20
y(i) = LOOCV(i,data,2);
end
plot(x,y);

%Question 7
%{
Answer:
From looking at the graph it's 8.
%}

%Question 8
%{
Answer:
From looking at the graph it's 0.225.
%}

%Question 9
%{
Answer:
D. K = 1
Run following code one by one if you want to confirm.
%}
knn_wrp(1,data,4);
knn_wrp(3,data,4);
knn_wrp(5,data,4);
knn_wrp(7,data,4);

%To get the answers for 10 and 11, you need to make a new plot with the following code
x = 1:20;
y = []
for i = 1:20
y(i) = LOOCV(i,data,4);
end
plot(x,y);
%Question 10
%{
Answer:
From looking at the graph it's 5.
%}

%Question 11
%{
Answer:
From looking at the graph it's 0.27.
%}