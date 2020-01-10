clc,clear,clf
SNR_min = 0;
SNR_step = 2;
SNR_max = 10;

M = 4;
symbol_num = 1e7;
data = randi([0 M-1],symbol_num,1);
txSig = pskmod(data,M,pi/M,'gray');
SNR_db = SNR_min:SNR_step:SNR_max;
SNR = 10 .^ (SNR_db ./ 10);
SER = zeros(size(SNR_db));
% BER = zeros(size(SNR_db));

%% 1a SER of QPSK in AWGN  
for SNR_idx = 1:length(SNR_db)
    % pay attentation to E_bit and E_symbol
	rxSig = awgn(txSig,SNR_db(SNR_idx) + 3,'measured'); 
	rxdata = pskdemod(rxSig,M,pi/M,'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','*','DisplayName','1a AWGN MC');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
theory_of_1a = 2 .* qfunc(sqrt(2 .* SNR)) - qfunc(sqrt(2 .* SNR)) .* qfunc(sqrt(2 .* SNR));
% theory_of_1a = 2 .* qfunc(sqrt(2 .* SNR));
semilogy(SNR_db,theory_of_1a, 'Marker', '>','DisplayName','1a AWGN theory');

%% prepare for 1b and following
SNR_max = 25;
SNR_db = SNR_min:SNR_step:SNR_max;
SNR = 10 .^ (SNR_db / 10);
SER = zeros(size(SNR_db));
txSigPower = sum(abs(txSig(:)).^2)/numel(txSig);
%% 1b SER of QPSK in Rayleigh flat fading
h = sqrt(1/2) .*  (randn(symbol_num,1) + 1i * randn(symbol_num,1));
for SNR_idx = 1:length(SNR_db)
    % pay attentation to E_bit and E_symbol
    txSig_after_channel = h .* txSig;
    N_0 = txSigPower / (2 * SNR(SNR_idx));
    noise = sqrt(N_0/2) .* (randn(symbol_num,1) + 1i * randn(symbol_num,1));
    rxSig = txSig_after_channel + noise;
% 	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig ./ h;
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','o','DisplayName','1b fading MC');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
theory_of_1b = 1 - sqrt(SNR ./ (1+SNR));
semilogy(SNR_db,theory_of_1b,'Marker','>','DisplayName','1b fading theorical upper bound');

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
    N_0 = txSigPower / (2 .* SNR(SNR_idx));
    noise = sqrt(N_0/2) .* (randn(symbol_num,L) + 1i * randn(symbol_num,L));
    rxSig = txSig_after_channel + noise;
% 	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig .* conj(h) ./ sum(abs(h).^2,2);
    rxSig = sum(rxSig,2);
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','^','DisplayName','1c repetition coding MRC MC');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
% theory_of_1c = 3 ./ (4 .* SNR .^ 2);
theory_of_1c = 1 - sqrt( SNR ./ (1 + SNR)) - (sqrt((SNR ./ (1+SNR)) .^3)) ./ ( 2 .* SNR);
semilogy(SNR_db,theory_of_1c,'Marker','>','DisplayName','1c theorical upper bound');
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
    N_0 = txSigPower / (2 .* SNR(SNR_idx));
    noise = sqrt(N_0/2) .* (randn(symbol_num,1) + 1i * randn(symbol_num,1));
    rxSig = txSig_after_channel + noise;
% 	rxSig = awgn(txSig_after_channel,SNR_db(SNR_idx) + 3,txSigPower); 
    rxSig = rxSig ./ h;
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','square','DisplayName','1d selection coding MC');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
% theory_of_1d = 3 ./ (SNR .^ 2);
theory_of_1d = 1 - 2.* sqrt(SNR ./ (SNR + 1)) + sqrt(SNR ./ (SNR + 2));
semilogy(SNR_db,theory_of_1d,'Marker','>','DisplayName','1d theorical upper bound');
% legend('MRC','selection combiner');
legend

%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% 3. MISO 2 antennas at transmitter.
h = sqrt(1/2) .*  (randn(symbol_num / L,L) + 1i * randn(symbol_num / L,L));
H = zeros(symbol_num,L);
H(1:2:end,:) = h;
H(2:2:end,:) = conj(fliplr(h));
H(2:2:end,2) = -H(2:2:end,2);
for SNR_idx = 1:length(SNR_db)
    N_0 = txSigPower / (2 .* SNR(SNR_idx));
    noise = sqrt(N_0/2) .* (randn(symbol_num,1) + 1i * randn(symbol_num,1));
    for k = 1:2:symbol_num
        txSig_after_channel(k:k+1) = H(k:k+1,:) * txSig(k:k+1);  
    end
    rxSig = txSig_after_channel + noise;
    absH = sum(abs(H),2);
    for k = 1:2:symbol_num
        rxSig(k:k+1) = H(k:k+1,:)' * rxSig(k:k+1) ./ absH(k);
    end
	rxdata = pskdemod(rxSig, M, pi/M, 'gray');	
	[~,SER(SNR_idx)] = symerr(data,rxdata);
end
semilogy(SNR_db,SER,'Marker','diamond','DisplayName','3 MISO Alamouti MC');
hold on
grid on
xlabel("SNR:E_b/N_0 (dB)");
ylabel("Symbol Error Rate");
legend

