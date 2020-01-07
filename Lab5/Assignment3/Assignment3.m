data = load('data_lvq_A','-mat');
dataA = data.matA;
data = load('data_lvq_B','-mat');
dataB = data.matB;
% for question 1
% scatter(dataA(:,1), dataA(:,2), 20, 'red', 'filled');
% hold on
% scatter(dataB(:,1), dataB(:,2), 20, 'blue', 'filled');
% hold off
% legend('dataA', 'dataB');

dataA(:,3) = 0;
dataB(:,3) = 1;

% sample_size = [1,1; 1,2; 2,1; 2,2]; % for question 5
sample_size = [2,1]; % for question 4
epoch = 50;
error_bound = 0.0000001;
color = ["red", "blue", "yellow", "green"];
for i = 1:size(sample_size,1)
    % choose random number of points as initial prototypes
    indexA = randsample(1:length(dataA), sample_size(i,1));
    indexB = randsample(1:length(dataB), sample_size(i,2));
    prototype = [dataA(indexA,:); dataB(indexB,:)];
    
    [X, error_rate, prototype, relevances] = LVQ1MainEpoch([dataA; dataB],prototype,epoch, error_bound);
    subplot(2,1,1)
    plot(error_rate);
    subplot(2,1,2)
    plot(relevances(:,1));
    hold on
    plot(relevances(:,2));
    legend('lamda1','lamda2');
    hold off
    f2 = figure;
    for j = 1:size(prototype,1)
        points = X(X(:,4) == j,:);
        scatter(points(:,1), points(:,2),20, color(j),"filled");
        hold on
        scatter(prototype(j,1), prototype(j,2), 60, color(j));
        hold on
    end
    title(num2str(sample_size(i,:)));
end
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

    