feature = [[4,6,8,7,4];[5,3,7,4,6];[6,9,3,8,5]];
feature_mean = [mean(feature(1,:)), mean(feature(2,:)), mean(feature(3,:))];
biased_variance_matrix = rand(3);

for i = 1:3
    for j = 1:3
        biased_variance_matrix(i,j) = ((feature(i,:)-feature_mean(i))*(feature(j,:)-feature_mean(j)).')/5;
        %fprintf('the covariance between %d and %d is:\n',i,j);
        %disp(cov(feature(i,:),feature(j,:)));
    end
end

test = [4,6.5,1];
prob = 1;
for i = 1:3
    prob = prob * normpdf(test(i),feature_mean(i),biased_variance_matrix(i,i));
end




    
        