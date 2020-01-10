% Problem3
clc,clear,clf

num = 500;
a = 5;

figure(1)
interval_len = 0.1;
intervals = [0:interval_len:1.7];
U = rand([1,num]);
X = F_weibull_inverse(U,a);
h = histogram(X,intervals);
grid on 

figure(2)
x = 0:0.02:1.6;
f = f_weibull(x,a);
plot(x,f,'r')
hold on 
grid on 
scatter(intervals(1:end-1) + interval_len /2 , h.Values ./ num ./ interval_len);

function f = f_weibull(x,a)
    f = a .* x.^(a-1) .* exp(-x.^a);
end

function X = F_weibull_inverse(U,a)
    X = (-(log(1-U))).^(1/a);
end