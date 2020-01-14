function [cluster_matrix,centroids] = kmeansplusplus(feature_vector,k,should_plot_centroid_movement,ispluspulsinitialized)
[row_size,col_size] = size(feature_vector);
if row_size<=k
    cluster_matrix=[feature_vector, 1:row_size];
    centroids = feature_vector;
else
    centroids = zeros(k,col_size);
    if ispluspulsinitialized == 1
        centroids(1,:) = feature_vector(randsample(row_size,1),:);
        if k > 1
            for idx = 2:k
                dist_matrix=DistMatrix(feature_vector,centroids);
                [mins,~]=min(dist_matrix,[],2);
                weighted_idx=randsample(1:size(mins,1),1,true,mins);
                centroids(idx,:)=feature_vector(weighted_idx,:);
            end
        end
    else
    centroid_idx = randperm(size(feature_vector,1));
    for i = 1:k
        centroids(i,:)=feature_vector(centroid_idx(i),:);
    end
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

