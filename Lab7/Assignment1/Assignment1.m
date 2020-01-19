load('cluster_data.mat')
%Question 1:
%Answer: Chebyshev distance
%Question 2:
%Answer: check image names
%To verify run 1 at a time.
hold on;
create_edge_cluster(cluster_data,0.05);
hold off;
hold on;
create_edge_cluster(cluster_data,0.1);
hold off;
hold on;
create_edge_cluster(cluster_data,0.15);
hold off;
hold on;
create_edge_cluster(cluster_data,0.2);
hold off;
hold on;
create_edge_cluster(cluster_data,0.25);
hold off;
%Question 3:
%Answer:upload A1Q3.png
hold on;
subplot(5,1,1)
create_edge_cluster(cluster_data,0.05);
subplot(5,1,2)
create_edge_cluster(cluster_data,0.1);
subplot(5,1,3)
create_edge_cluster(cluster_data,0.15);
subplot(5,1,4)
create_edge_cluster(cluster_data,0.2);
subplot(5,1,5)
create_edge_cluster(cluster_data,0.25);
hold off;
%Question 4:
%Answers: In the reverse order of t.
%Question 5:
%Answer: upload A1Q5. Coincidentally, optimal t=0.18, in my opinion,
%because it forms exactly 4 clusters. I deducted that it was 0.18 because
%if t~=0.2, then there are only 3 clusters and anything smaller than 0.18
%produces 5 or more clusters.
hold on;
create_edge_cluster(cluster_data,0.18);
hold off;
%Question 6
%Answer: upload A1Q6