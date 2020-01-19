function [j] = sum_of_squared_error(clust)
j=0;
for idx = 1:size(clust,1)
    local_cluster = cell2mat(clust{idx,:})
    dist = pdist(local_cluster)
    m = mean(dist)
    if isnan(m)
        continue;
    else
        for idx2 = 1:size(dist)
            j=j+abs(dist(idx2) - m).^2
        end
    end
end
end