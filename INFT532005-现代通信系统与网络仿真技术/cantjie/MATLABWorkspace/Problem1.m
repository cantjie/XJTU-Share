% Problem1
clc,clear,clf

infty_n = 1e5;
approx_sample_n = 30;

m = 4:20;
T_b = 1;
f_s = m ./ T_b;

SNR_db_MSK = zeros(size(m));
SNR_db_rec = zeros(size(m));
for idx = 1:length(m)
    approx_points = 0: 1/approx_sample_n : f_s(idx)/2;
    E_signal_MSK = sum(G_MSK(approx_points,T_b));
    E_signal_rec = sum(G_rec(approx_points,T_b));
    
    approx_points = f_s(idx)/2 : 1/approx_sample_n : infty_n;
    E_noise_MSK = sum(G_MSK(approx_points,T_b));
    E_noise_rec = sum(G_rec(approx_points,T_b));
    
    SNR_db_MSK(idx) = 10 * log10(E_signal_MSK / E_noise_MSK);
    SNR_db_rec(idx) = 10 * log10(E_signal_rec / E_noise_rec);
end

plot(m,SNR_db_MSK,'o-','DisplayName','SNR_a of MSK signal');
hold on 
plot(m,SNR_db_rec,'.-','DisplayName','SNR_a of rectangular pulse shape');
xlabel('number of samples in T_b');
ylabel('SNR_a');
legend
grid on 

figure(2)
f = -4:0.02:4;
y = G_MSK(f,1);
subplot(1,2,1)
plot(f,y,'DisplayName','MSK signal');
title('MSK signal');
grid on 

subplot(1,2,2);
y = G_rec(f,1);
plot(f,y);
title('rectangular');
grid on 

function y = G_MSK(f,T_b)
    y = 16 .* T_b .* (cos(2 .* pi .* T_b .* f)).^2 ./ ( pi^2 .* (1-(4 .* T_b .* f).^2)).^2;
end

function y = G_rec(f,T_b)
    y = (sinc(f .* T_b)).^2;
end
