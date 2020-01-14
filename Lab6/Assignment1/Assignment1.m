load('kmeans1.mat')
load('clusterCentroids.mat')
load('checkerboard.mat')
%Q1:
%Answer: Upload kmeans.m
%Q2:
hold on;
subplot(3,1,1);
plot_cluster(kmeans1,2);
subplot(3,1,2);
plot_cluster(kmeans1,4);
subplot(3,1,3);
plot_cluster(kmeans1,8);
hold off;

