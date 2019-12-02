mu = [3 4];
sigma = [1 0; 0 2];
x1 = -10:0.1:10;
x2 = -10:0.1:10;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];
y = mvnpdf(X,mu,sigma);
y = reshape(y,length(x2),length(x1));
mesh(x1,x2,y);
caxis([min(y(:))-0.5*range(y(:)),max(y(:))])
axis([-10 10 -10 10 0 0.2])
xlabel('x1')
ylabel('x2')
zlabel('Probability Density')

% calculate Mahalanobis distance
mvn = mvnrnd([3 4], [1 0; 0 2]);
points = [10 10; 0 0; 3 4; 6 8];
distance = mahal(points, mvn);