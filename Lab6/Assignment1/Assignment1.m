load('kmeans1.mat')
load('clusterCentroids.mat')
load('checkerboard.mat')
%Q1:
%Answer: Upload kmeans.m
%Q2:
%Answer: Upload A1Q2.png
hold on;
subplot(3,1,1);
plot_cluster(kmeans1,2,0);
subplot(3,1,2);
plot_cluster(kmeans1,4,0);
subplot(3,1,3);
plot_cluster(kmeans1,8,0);
hold off;

%Q3:
%Answer: Upload A1Q3.png
hold on;
subplot(3,1,1);
plot_cluster(kmeans1,2,1);
legend({'centroid movement'},'Location','northwest','Orientation','horizontal')
subplot(3,1,2);
plot_cluster(kmeans1,4,1);
legend({'centroid movement'},'Location','northwest','Orientation','horizontal')
subplot(3,1,3);
plot_cluster(kmeans1,8,1);
legend({'centroid movement'},'Location','northwest','Orientation','horizontal')
hold off;

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

%Q6
%Answer: Upload A1Q6.m

%Q7
%Answer:The answer is kopt=2

%Q8
%Answer: Upload kmeansplusplus.m

%Q9-Q12
%Answer:
min_k_errs=zeros(1,10);
min_kpp_errs=zeros(1,10);
for idx = 1:10
    min_k_err= intmax;
    min_kpp_err = intmax;
    for idx2 = 1:20
        k_err = quantization_error_plusplus(checkerboard,100,0);
        kpp_err = quantization_error_plusplus(checkerboard,100,1);
        if k_err<min_k_err
            min_k_err = k_err;
        end
        if kpp_err<min_kpp_err
            min_ppk_err = kpp_err;
        end
    end
    min_k_errs(idx)=min_k_err;
    min_kpp_errs(idx)=min_kpp_err;
end
q9mean=mean(min_kpp_errs);% I got
q10dev=std(min_kpp_errs);% I got
q11mean=mean(min_k_errs);% I got
q12dev=std(min_k_errs);% I got