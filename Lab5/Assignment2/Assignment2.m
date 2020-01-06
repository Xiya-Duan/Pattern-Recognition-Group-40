load('data_lvq_A(1).mat');
load('data_lvq_B(1).mat');
%Q1:
%k-fold validation algorithm:
data = [matA ; matB];
n = size(data,1);
k = 10;
accuracies = zeroes(1,k);
folds = [];
for i=1:k
    folds = [folds; repmat(i,n/k,1)];
end
for fold=1:k
    testIds = find(folds==fold);
    trainIds = find(folds~=fold);
    %train
    accuracies(fold) = 0;%test
end
mean(accuracy);