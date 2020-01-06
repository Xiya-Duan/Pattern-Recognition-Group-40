%%Q1
%%Answer: upload A1Q1.png.
%%To generate it again, run the following script:
aX = matA(:,1);
aY = matA(:,2);
bX = matB(:,1);
bY = matB(:,2);
scatter(aX,aY,'red');
hold on;
scatter(bX,bY,'green');
hold off;
%%Q2
%%Answer: Class A has 2 prototypes, Class 2 has 1 prototype, due to
%%variance
%%Q3
%%Answer bellow
%%Don't recommend running this as is.
for i = 1:P % number of examples
    example = X(i, :);%sequentially present an example from dataset X
    dist = pdist2(example, prototype,'squaredeuclidean');%calculate distance between example and prototype
    wstar = min(dist);%determine the winner
    wstar = wstar + eta * Psi(label(wstar), label(example)) * (example - wstar);2);%update the winner
end
%%Q4
%%



