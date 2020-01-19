load('cluster_data.mat')
%Question 1:
%Answer: upload A2Q1
link=linkage(cluster_data,'single');
clust=cluster(link,'Maxclust',4);
hold on;
scatter(cluster_data(:,1),cluster_data(:,2),[],clust);
[~,centroids]=kmeans(cluster_data,4);
scatter(centroids(:,1),centroids(:,2),'rx');
hold off;
%Question 2:
%Answer: upload A2Q2
link=linkage(cluster_data,'complete');
clust=cluster(link,'Maxclust',4);
hold on;
scatter(cluster_data(:,1),cluster_data(:,2),[],clust);
[~,centroids]=kmeans(cluster_data,4);
scatter(centroids(:,1),centroids(:,2),'rx');
hold off;
%Quesion 3:
%Answer: True, because the differences that exist are not the majority.
%Question 4:
%Answer: False, because there are differences between the 2 results.
%Question 5:
%Answer: upload A2Q5
link=linkage(cluster_data,'average');
clust=cluster(link,'Maxclust',4);
dendrogram(link,'ColorThreshold','default');
%Question 6:
%Answer: Looking at the cut-off point, the answer is 4.
%Question 7:
%Answer: False, because all points need to be allocated. I think...
%Question 8:
%Answer: Upload Assignment2.m