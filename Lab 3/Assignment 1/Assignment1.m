% answer of question 1 - 5, check workspace to get values.
hit_q1 = 1 - normcdf(10, 7, 2);
fa_q2 = 1 - normcdf(10, 5, 2);
d_q3 = (7-5)/2.0;
d_q4 = (9-5)/2.0;
mu_q5 = 11;
% answer of question 7 - 10
data = load('.\lab3_1.mat', '-mat', 'outcomes');
records = data.outcomes;
hit_q7 = 0;
fa_q8 = 0;
for i = 1:200
    record = records(i,:);
    if record == [1 1]
        hit_q7 = hit_q7 + 1;
    elseif record == [0 1]
        fa_q8 = fa_q8 + 1;
    end
end
hit_q7 = hit_q7/200;
fa_q8 = fa_q8/200;
for d = 1.83:0.005:1.88
    find_roc(d)
end
%plot(hit_g7, fa_q8);
xlabel('fa');
ylabel('hit');
legend
hold off

function find_roc(d)
    mu1 = 5;
    sigma = 2;
    mu2 = mu1 + 2*d;
    x = mu1-3*sigma:0.1:mu2 + 3*sigma;
    hit = [];
    fa = [];
    for x_b = x
        hit = [hit 1 - normcdf(x_b, mu1, sigma)];
        fa = [fa normcdf(x_b, mu2, sigma)];
    end
    plot(fa, hit, 'DisplayName', num2str(d));
    hold on
end