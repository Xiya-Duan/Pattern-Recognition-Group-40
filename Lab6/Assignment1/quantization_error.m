function [error] = quantization_error(feature_vector,k)%J(k)
if k > size(feature_vector,1)
    error=NaN;
    print("Incorrect k. Must be lower than the number of points in the feature vector");
else
    error = 0;
    [cluster_matrix,centroids] = kmeans(feature_vector,k,0);
    for i = 1:k
        idxk = cluster_matrix(:,3) == i;
        current_cluster=cluster_matrix(idxk,[1,2]);
        current_centroid=centroids(i,:);
        for idx = 1:size(current_cluster,1)
            error = error + 1/2 * (pdist2(current_cluster(idx,:),current_centroid)).^2;
        end
    end
end
end