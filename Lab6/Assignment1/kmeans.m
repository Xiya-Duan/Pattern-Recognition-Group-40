function [cluster_matrix,centroids] = kmeans(feature_vector,k,should_plot_centroid_movement)
[row_size,col_size] = size(feature_vector);
if row_size<=k
    cluster_matrix=[feature_vector, 1:row_size];
    centroids = feature_vector;
else
    centroid_idx = randperm(size(feature_vector,1));
    centroids = zeros(k,col_size);
    for i = 1:k
        centroids(i,:)=feature_vector(centroid_idx(i),:);
    end
    previous_iteration = zeros(row_size,1);
    while 1
        dist_matrix = DistMatrix(feature_vector,centroids);
        [~,current_iteration]=min(dist_matrix,[],2);
        if current_iteration==previous_iteration
            break;
        else
            previous_iteration=current_iteration;
        end
        for i = 1:k
            row_idx=find(current_iteration==i);
            if row_idx
                current_centroid=mean(feature_vector(row_idx,:),1);
                if(should_plot_centroid_movement==1)
                    hold on;
                    plot_arrow(centroids(i,1),centroids(i,2),current_centroid(:,1),current_centroid(:,2));
                end
                centroids(i,:)=current_centroid;
            end
        end
    end
    cluster_matrix=[feature_vector,current_iteration];
end
end

function dist_matrix = DistMatrix(point1,point2)
[length_point1]=size(point1,1);
[length_point2]=size(point2,1);

dist_matrix = zeros(length_point1,length_point2);
for idx = 1:length_point1
    for idx2 = 1:length_point2
        dist_matrix(idx,idx2)=pdist2(point1(idx,:),point2(idx2,:));
    end
end
end

