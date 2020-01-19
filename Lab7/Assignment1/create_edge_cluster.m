function create_edge_cluster(cluster_data,t)
%CREATE_EDGE_CLUSTER Summary of this function goes here
%   Detailed explanation goes here
x = cluster_data(:,1);
y = cluster_data(:,2);
len = size(cluster_data,1);
hold on;
scatter(x,y);
for idx = 1:len
    for idx2 = idx:len
        x1=x(idx);
        x2=x(idx2);
        y1=y(idx);
        y2=y(idx2);
        distance = pdist2([x1 y1], [x2 y2]);
        if distance~=0 && distance <= t
            plot([x1 x2],[y1 y2]);
        end
    end
end
end

