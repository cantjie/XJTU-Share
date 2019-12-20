clc,clear
clf,

SNR_min = 0;
SNR_max = 10;
SNR_step = 2;

%1.b)

SNR_db = SNR_min:SNR_step:SNR_max;
SNR = 10 .^ (SNR_db/10);

Q = qfunc(sqrt(2 .* SNR));
P_e_precise = 2 .* Q - Q .^ 2;
P_e_ub = 2 .* Q + qfunc(sqrt(4 .* SNR));
P_e_iub = 2 .* Q;
P_e_nna = 2 .* Q;

semilogy(SNR_db,P_e_precise,'Marker','o');
hold on;
grid on;
semilogy(SNR_db,P_e_ub,'Marker','*');
semilogy(SNR_db,P_e_iub,'Marker','^');
semilogy(SNR_db,P_e_nna,'Marker','s');
xlabel("SNR:E_b/N_0 (dB)");
ylabel("SER");
legend("precise","union bound","intellegent union bound","nearest neighboorhood approximation");

% 1.d)

figure

M = 4;
symbol_num = 1e7;
data = randi([0 M-1],symbol_num,1);
txSig = pskmod(data,M,pi/M,'gray');
SNR_db = SNR_min:SNR_step:SNR_max;
SER = zeros(size(SNR_db));
BER = zeros(size(SNR_db));
for SNR_idx = 1:length(SNR_db);
    % pay attentation to E_bit and E_symbol
	rxSig = awgn(txSig,SNR_db(SNR_idx) + 3,'measured'); 
	rxdata = pskdemod(rxSig,M,pi/M,'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
	[~,BER(SNR_idx)] = biterr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','*');
hold on
grid on
semilogy(SNR_db,BER,'Marker','o');
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Error Rate");
legend("SER","BER");