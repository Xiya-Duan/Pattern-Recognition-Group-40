data = load('data_lvq_A','-mat');
dataA = data.matA;
data = load('data_lvq_B','-mat');
dataB = data.matB;

dataA(:,3) = 0;
dataB(:,3) = 1;

epoch = 50;
error_bound = 0.0000001;

% initial prototypes
indexA = randsample(1:length(dataA), 2);
indexB = randsample(1:length(dataB), 1);
prototype = [dataA(indexA,:); dataB(indexB,:)];

% creat N fold
N = 10;
error_rate_array = [];
for i = 1:N
    indexA_fold = randsample(1:length(dataA), length(dataA)/(11-i)); % random create fold of dataA
    indexB_fold = randsample(1:length(dataB), length(dataB)/(11-i)); % random create fold of dataB
    fold = [dataA(indexA_fold,:); dataB(indexB_fold,:)]; % combine foldA and foldB to get final fold
    dataA(indexA_fold,:) = []; % implement replacement
    dataB(indexB_fold,:) = [];
    if i < 10
        [X, error_rate, prototype] = LVQ1MainEpoch(fold,prototype,epoch, error_bound);% trainning
    else
        [X, error_rate, prototype] = LVQ1Test(fold,prototype,epoch, error_bound);% test
    end
    error_rate_array(i) = error_rate(end); % record
end
bar(error_rate_array); % create bar
for i = 1:length(error_rate_array)
text(i-0.3, error_rate_array(i)+0.01, [num2str(error_rate_array(i)*100) '%']);
end
hold on
test_error = ones(N,1) * error_rate_array(end);
plot(test_error);
hold on
error_mean = ones(N,1) * mean(error_rate_array); % get mean
plot(error_mean);
text(6, error_mean(1)+0.01, ['Mean:' num2str(error_mean(1)*100) '%']);
legend("Error rate","Test error","Mean");
hold off


function [X, error_rate, prototype, relevances] = LVQ1MainEpoch(X,prototype,epochs, error_bound)
    % the third element in each row represent the class,
    % the fourth element in each roww represent the prototype.
    error_rate = [];
    relevance = [0.5,0.5];
    relevances = [];
    relevances(1,:) = [0.5,0.5];
    for n = 1:epochs
        error_num = 0;
        for i = 1:length(X) % number of examples
            example = X(i,:);%sequentially present an example from dataset X
            dist = [];
            for j = 1:length(prototype)
                % compute distance with relevance
                dist(j) = power(example(1)- prototype(j,1),2) * relevance(1) + power(example(2)- prototype(j,2),2) * relevance(2);
            end
            index_correct = prototype(:,3) == example(3);
            index_wrong = prototype(:,3) ~= example(3);
            index_correct = dist == min(dist(index_correct));
            index_wrong = dist == min(dist(index_wrong));
            % set the prototype to X
            index = dist == min(dist);
            X(i,4) = find(index_correct);
            prototype(index_correct,1:2) = prototype(index_correct,1:2) + 0.01*dist(index_wrong)/power(dist(index_wrong)+dist(index_correct),2)*(example(1:2) - prototype(index_correct,1:2));
            prototype(index_wrong,1:2) = prototype(index_wrong,1:2) - 0.01*dist(index_correct)/power(dist(index_wrong)+dist(index_correct),2)*(example(1:2) - prototype(index_wrong,1:2));
            % update relevance
            for k = 1:2
                distance_power = power(dist(index_wrong)+dist(index_correct),2);
                relevance(k) = relevance(k) + 0.01 * (dist(index_correct)/distance_power*power(example(k)-prototype(index_wrong,k),2) - dist(index_wrong)/distance_power*power(example(k)-prototype(index_correct,k),2));
                if relevance(k) < 0
                    relevance(k) = 0;
                    relevance(3-k) = 1;
                    break;
                end
            end
            % normalisation
            sum_relevances = sum(relevance);
            relevance(1) = relevance(1)/sum_relevances;
            relevance(2) = relevance(2)/sum_relevances;
            % calculate error rate
            if index == index_correct
                error_num = error_num + 1;
            end
        end
        error_rate(n) = error_num/length(X);
        % stop trainning when trainning error is approximately constant.
        if n > 10
            if var(error_rate(n-3:n)) < error_bound
                break;
            end
        end
        relevances(n+1,:) = relevance;
    end
end

function [X, error_rate, prototype] = LVQ1Test(X,prototype,epochs, error_bound)
    % the third element in each row represent the class,
    % the fourth element in each roww represent the prototype.
    error_rate = [];
    for n = 1:epochs
        error_num = 0;
        for i = 1:length(X) % number of examples
            example = X(i,:);%sequentially present an example from dataset X
            dist = pdist2(example(1:2), prototype(:,1:2),'squaredeuclidean');%calculate distance between example and prototype
            index = dist == min(dist);
            wstar = prototype(index,:);%determine the winner
            % set the prototype to X
            X(i,4) = find(index);
            % calculate error rate
            if(wstar(3) ~= example(3))
                error_num = error_num + 1;
            end
        end
        error_rate(n) = error_num/length(X);
        % stop trainning when trainning error is approximately constant.
        if n > 10
            if var(error_rate(n-3:n)) < error_bound
                break;
            end
        end
    end
end

    