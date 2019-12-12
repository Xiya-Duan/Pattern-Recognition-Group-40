data_1 = load('lab3_3_cat1.mat', '-mat');
data_1 = data_1.x_w1;
data_2 = load('lab3_3_cat2.mat', '-mat');
data_2 = data_2.x_w2;
data_3 = load('lab3_3_cat3.mat', '-mat');
data_3 = data_3.x_w3;
h = 1;
% answer for q1-9 -> see array prob_d
prob_d = [];
points = [data_1; data_2; data_3];
class_label = ones(10,1);
labels = [class_label; class_label*2; class_label*3];
u = [0.5, 1.0, 0.0];
v = [0.31, 1.51, -0.50];
w = [-1.7, -1.7, -1.7];
KNN_labels = [];
x = [u; v; w];
for i = 1:3
    vector = x(i,:);
    prob_d = prob(vector, h, data_1, prob_d);
    prob_d = prob(vector, h, data_2, prob_d);
    prob_d = prob(vector, h, data_3, prob_d);
    label = KNN(vector, 5, points, labels);
    % answers for last 6 question (Change value of k in KNN.m)
    KNN_labels = [KNN_labels label];
end
% answer for q10-12 I assume they all are 1/3 (as the hint says "make it simple") 
% Please correct me if you think it's wrong
% answer for q13-21 -> see array posterio
posterio = [];
for i = 0:2
    for j = 1:3
        posterio = [posterio prob_d(i*3+j)/(prob_d(i*3+1) + prob_d(i*3+2) + prob_d(i*3+3))];
    end    
end
% For q22-24, compare each pairs of three , choose the largest one. I think
% it should be : B, B, A
% For q25-27, change h to 2 and run again, I think it should be same as
% q22-24

function prob_d = prob(x, h, data, prob_d)
    sum = 0;
    for i = length(data)
        point = data(i,:);
        sum = sum + exp(-((x(1)-point(1))^2 + (x(2)-point(2))^2 + (x(3)-point(3))^2)/(2*(h^2)));            
    end
    sum = sum / (h*sqrt(2*pi))^3;
    sum = sum / 10.0;
    prob_d = [prob_d sum];
end

