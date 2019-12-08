function errorRate = LOOCV(K, data, nr_of_classes)
errorRate = 0;
N = size(data,1);
class_labels = floor( (0:length(data)-1) * nr_of_classes / length(data) );
results = zeros(N,2);
% Validate classifier settings with leave-one-out procedure
for idx=1:N
    % Extract sample
    sample = data(idx,:);
    % Copy the database
    data_copy = data;
    % Copy the classes vector
    class_labels_copy = class_labels;
    % Keep the sample real class
    results(idx,2) = class_labels(idx);
    % Remove sample from database
    data_copy(idx,:) = [];
    % Remove sample from class vector
    class_labels_copy(idx)   = [];
    % Execute the classification algorithm
    results(idx,1) = KNN(sample,K,data_copy,class_labels_copy);
    % Keep the class found by the classifier for the current sample
end
for idx=1:N
    if results(idx,1) ~= results(idx,2)
        errorRate = errorRate + 1;
    end
end
errorRate = errorRate/N;
end