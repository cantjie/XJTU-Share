%Problem2
clc,clear,clf

n_sample = 1e4;
t = 0 : 1/20 : n_sample / 20 - 1e-8;
signal = sin(6 .* t);

bias = 1/16;
q = quantizer('fixed','Round','saturate',[4,3]);
signal_q = quantize(q,signal - bias) + bias;
error = signal_q - signal;

% [signal_q_custom, error_custom] = quantize_costum(signal,1,3,bias); 

mean_error = mean(error)
mean_error_square = mean(error .^ 2)

hist(error,30)


% 这个只是检验一下自己对quantizer函数的理解。
% function [y,error] = quantize_costum(x,intLength,fracLength,bias)
%     error = zeros(size(x));
%     y = zeros(size(x));
%     step = 2^(-fracLength);
%     levels = -2^(intLength - 1) : step : 2^(intLength - 1) - 1e-8;
%     levels = levels + bias;
%     levels = levels(:);
%     % levels is a column vector
%     % suppose x is a row vector
%     x_rep =  repmat(x,length(levels),1);
%     err = x_rep -  levels;
%     [~,min_idx] = min(abs(err));
%     for idx = 1:length(x)
%         error(idx) = err(min_idx(idx),idx);
%         y(idx) = levels(min_idx(idx));
%     end
% end