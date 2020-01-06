function [wstar] = LVQ1MainEpoch(P,X,prototype)
    for i = 1:P % number of examples
        example = X(i, :);%sequentially present an example from dataset X
        dist = pdist2(example, prototype,'squaredeuclidean');%calculate distance between example and prototype
        wstar = min(dist);%determine the winner
        wstar = wstar + eta * Psi(label(wstar), label(example)) * (example - wstar);2);%update the winner
    end
end

