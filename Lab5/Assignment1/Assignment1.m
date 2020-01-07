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

sample_size = [1,1; 1,2; 2,1; 2,2]; % for question 5
% sample_size = [2,1]; % for question 4
epoch = 50;
error_bound = 0.0000001;
color = ["red", "blue", "yellow", "green"];
for i = 1:size(sample_size,1)
    % choose random number of points as initial prototypes
    indexA = randsample(1:length(dataA), sample_size(i,1));
    indexB = randsample(1:length(dataB), sample_size(i,2));
    prototype = [dataA(indexA,:); dataB(indexB,:)];
    [X, error_rate, prototype] = LVQ1MainEpoch([dataA; dataB],prototype,epoch, error_bound);
    % for question 5
%     plot(error_rate);
%     hold on
    % for question 5 end
    % for question 6
    subplot(2,2,i);
    for j = 1:size(prototype,1)
        points = X(X(:,4) == j,:);
        scatter(points(:,1), points(:,2),20, color(j),"filled");
        hold on
        scatter(prototype(j,1), prototype(j,2), 60, color(j));
        hold on
    end
    title(num2str(sample_size(i,:)));
    % for question 6 end
end
% for question 6
 hold off
% for question 6 end
% for question5
% xlabel("number of epochs");
% ylabel("training error");
% legend("1-1", '1-2', '2-1', '2-2');
% hold off

function [X, error_rate, prototype] = LVQ1MainEpoch(X,prototype,epochs, error_bound)
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
            if(wstar(3) == example(3))
                psi = 1;
            else
                psi = -1;
                error_num = error_num + 1;
            end
            wstar(1:2) = wstar(1:2) + 0.01 * psi * (example(1:2) - wstar(1:2));%update the winner
            prototype(dist == min(dist),:) = wstar;
        end
        error_rate(n) = error_num/length(X);
        % stop trainning when trainning error is approximately constant.
        if n > 3
            if var(error_rate(n-3:n)) < error_bound
                break;
            end
        end
    end
end

    