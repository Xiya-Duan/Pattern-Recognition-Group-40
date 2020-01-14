%Q4:
%Answer: Upload A1Q4.png
hold on;
d_values=zeros(1,10);
d_max = [0 0];
for idx=1:10
    d_values(idx)=D(kmeans1,idx,2);
    if d_values(idx)>d_max(2)
        d_max =[idx d_values(idx)];
    end
end
plot(1:10,d_values,'DisplayName','D(k)');
plot(d_max(1),d_max(2),'rx','DisplayName','kopt');
legend;
hold off;

%Q5:
%Answer: Upload A1Q5.png
hold on;
j_values=zeros(1,10);
r_values=zeros(1,10);
j_max = [0 0];
r_max = [0 0];
j_values(1)=quantization_error(kmeans1,1);
r_values(1)=reference_function(kmeans1,1,2);
for idx=2:10
    j_values(idx)=quantization_error(kmeans1,idx);
    r_values(idx)=reference_function(kmeans1,idx,2);
    if r_values(idx) > r_max(2)
        r_max = [idx r_values(idx)];
    end
    if j_values(idx) > j_max(2)
        j_max = [idx j_values(idx)];
    end
end
plot(1:10,j_values,'y','DisplayName','J(k)');
plot(1:10,r_values,'g','DisplayName','R(k)');
plot(j_max(1),j_max(2),'rx','DisplayName','j-kopt');
plot(r_max(1),r_max(2),'bx','DisplayName','r-kopt');
legend;
hold off;

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

function [reference_value] = reference_function(feature_vector,k,d)
reference_value=quantization_error(feature_vector,1)*k.^(-2/d);
end

function d = D(feature_vector,k,d)
d=reference_function(feature_vector,k,d)/quantization_error(feature_vector,k);
end