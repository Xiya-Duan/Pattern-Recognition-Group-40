function plot_cluster(feature_vector,k,should_plot_centroid_movement)
[cluster_matrix,centroids] = kmeans(feature_vector,k,should_plot_centroid_movement);
for i = 1:k
idxk = cluster_matrix(:,3) == i;
x=cluster_matrix(idxk,1);
y=cluster_matrix(idxk,2);
hold on;
double_k = double(k);
double_i = double(i);
z=-3*ones(size(x,1),1);%Used to put the points in the background so the arrows are easily visible.
scatter3(x,y,z,[],'MarkerEdgeColor',[(double_k-double_i)/double_k double_i/double_k double_i/double_k],'MarkerFaceColor',[(double_k-double_i)/double_k double_i/double_k double_i/double_k],'DisplayName','Cluster');
x_centroid=centroids(:,1);
y_centroid=centroids(:,2);
scatter(x_centroid,y_centroid,[],'x','MarkerEdgeColor',[double_i/double_k (double_k-double_i)/double_k double_i/double_k],'MarkerFaceColor',[double_i/double_k (double_k-double_i)/double_k double_i/double_k],'DisplayName','Centroid');
end
end