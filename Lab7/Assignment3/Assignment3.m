x1=[0,0];
x2=[2,3];
x3=[1,4];
x4=[4,2];
x5=[3,0];
%Question 1
%Answer: a3q1
a3q1clust={{x1;x2;x3};{x4;x5}};
a3q1 = sum_of_squared_error(a3q1clust);
%Question 2
%Answer: a3q2
a3q2clust={{x2; x3; x5}; {x1; x4}};
a3q2 = sum_of_squared_error(a3q2clust);
%Question 3
%Answer: a3q3
a3q3clust={{x4}; {x1; x2; x3; x5}};
a3q3 = sum_of_squared_error(a3q3clust);
%Question 4
%Answer: a3q4
a3q4clust={{x3; x5 }; {x1; x2; x4}};
a3q4 = sum_of_squared_error(a3q4clust);
%Question 5
%Answer: The result with the lowest error.