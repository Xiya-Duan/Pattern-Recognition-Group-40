function plot_cluster(feature_vector,k)
[cluster_matrix,centroids] = kmeans(feature_vector,k);
for i = 1:k
idxk = cluster_matrix(:,3) == i;
x=cluster_matrix(idxk,1);
y=cluster_matrix(idxk,2);
hold on;
double_k = double(k);
double_i = double(i);
scatter(x,y,[],'MarkerEdgeColor',[(double_k-double_i)/double_k double_i/double_k double_i/double_k],'MarkerFaceColor',[(double_k-double_i)/double_k double_i/double_k double_i/double_k]);
x_centroid=centroids(:,1);
y_centroid=centroids(:,2);
scatter(x_centroid,y_centroid,[],'MarkerEdgeColor',[double_i/double_k (double_k-double_i)/double_k double_i/double_k],'MarkerFaceColor',[double_i/double_k (double_k-double_i)/double_k double_i/double_k]);
end
end