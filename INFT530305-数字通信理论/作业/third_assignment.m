clc,clear,clf
SNR_min = 0;
SNR_step = 2;
SNR_max = 10;

M = 4;
symbol_num = 1e6;
data = randi([0 M-1],symbol_num,1);
txSig = pskmod(data,M,pi/M,'gray');
SNR_db = SNR_min:SNR_step:SNR_max;
SER = zeros(size(SNR_db));
% BER = zeros(size(SNR_db));

%% 1a SER of QPSK in AWGN  
for SNR_idx = 1:length(SNR_db);
    % pay attentation to E_bit and E_symbol
	rxSig = awgn(txSig,SNR_db(SNR_idx) + 3,'measured'); 
	rxdata = pskdemod(rxSig,M,pi/M,'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','*');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");

%% prepare for 1b and following
SNR_max = 20;
SNR_db = SNR_min:SNR_step:SNR_max;
SER = zeros(size(SNR_db));
txSigPower = sum(abs(txSig(:)).^2)/numel(txSig);
%% 1b SER of QPSK in Rayleigh flat fading
h = sqrt(1/2) .*  (randn(symbol_num,1) + 1i * randn(symbol_num,1));
for SNR_idx = 1:length(SNR_db)
    % pay attentation to E_bit and E_symbol
    txSig_after_channel = h .* txSig;
	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig ./ h;
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','o');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
% legend('AWGN','Rayleigh flat fading');

%% a preparation for 1c and following
L = 2;
txSig = pskmod(data,M,pi/M,'gray');
txSig = repmat(txSig,1,L);
h = sqrt(1/2) .*  (randn(symbol_num,L) + 1i * randn(symbol_num,L));
%% 1c SER of QPSK in Rayleigh flat fading with diversity by repetion 
% coding. h changes fast and indepently, thus no need to cross code.
for SNR_idx = 1:length(SNR_db)
    % pay attentation to E_bit and E_symbol
    txSig_after_channel = txSig .* h;
	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig .* conj(h) ./ sqrt(sum(abs(h).^2,2));
    rxSig = sum(rxSig,2);
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','^');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
% legend('Rayleigh flat fading','repetition coding in Rayleigh');

%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 1d SER of QPSK in Rayleigh flat fading with diversity by repetition
% coding with selection combiner.
txSig = pskmod(data,M,pi/M,'gray');
h = sqrt(1/2) .*  (randn(symbol_num,L) + 1i * randn(symbol_num,L));
% although there are 2 branches, we should only remain the large h.
h = max(h,[],2);
for SNR_idx = 1:length(SNR_db)
    % pay attentation to E_bit and E_symbol
    txSig_after_channel = txSig .* h;
	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig ./ h;
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','square');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
legend('MRC','selection combiner');
