function value = KNN(point,K,data,class_labels)
%A more basic form
%{
N = size(data,1);
dists = zeros(N,1);
for idx = 1 : N %for each point in the total number of points
    dists(idx) = sqrt(sum((data(idx,:) - point).^2)); % calculate the distance
end
%}
%Eucledian
%dists = sqrt(sum(bsxfun(@minus, data, point).^2, 2)); %compute the distance of the given point to all other points
%Manhattan
dists = sum(abs(bsxfun(@minus, data, point)), 3);
[d,ind]=sort(dists); %order distances so that the closest ones are first
ind_closest = ind(1:K); %get the first K nearest
value = mode(class_labels(ind_closest)); %select the class that has the most appearences
end