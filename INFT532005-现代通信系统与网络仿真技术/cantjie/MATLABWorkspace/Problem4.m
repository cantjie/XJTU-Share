% Problem 4
clear,clc,clf

N_D_array = 3e3:3e3:3e4;
N_p = 54;
T = 10; % 10s
T_RAO = 5e-3; % 5ms, totally 2000 RAO time slot
beta_a = 3; % paramaters of Beta distribution 
beta_b = 4;
J = 9;
target_SNR = 10;
R_0 = 1;
filename_prefix = 'P4_R_0_1_';
total_service_time = zeros(size(N_D_array));
average_throughput = zeros(size(N_D_array));
average_access_delay = zeros(size(N_D_array));

for N_D_idx = 1:length(N_D_array)
    N_D = N_D_array(N_D_idx);

    % get the first activation time
    activate_time = betarnd(beta_a,beta_b,1,N_D) * T;
    activate_time = floor(activate_time ./ T_RAO);
    first_activate_time = activate_time;

    time_slot_idx = min(activate_time);
    is_done = 0;
    J_local = ones(1,N_D) * J; % when J_local(idx) == -1, MTCD of idx won't access
    sending_preamble_time = zeros(1,N_D);
    accessed_time = zeros(1,N_D);
    while is_done ~= 1
        % activate MTCD according to activate_time
        activate_request_MTCD_idxs = find(activate_time == time_slot_idx);
        N_a = length(activate_request_MTCD_idxs);

        % ACB test
        ACB_factor = min(1, N_p / N_a);
        rand_theta = rand(1,N_a);
        bad_request_mask = rand_theta > ACB_factor;    

        % bad request should request later
        delays = randi([1,4],size(activate_request_MTCD_idxs));
        delays = delays .* bad_request_mask;
        activate_time(activate_request_MTCD_idxs) = activate_time(activate_request_MTCD_idxs) + delays;

        % delete bad request ones and remains are activated successfully.
        activated_MTCD_idxs = find(activate_time == time_slot_idx);

        sending_preamble_time(activated_MTCD_idxs) = time_slot_idx;
        sending_preamble_MTCD_idxs = find(sending_preamble_time == time_slot_idx);

        % J validity check
        J_local(sending_preamble_MTCD_idxs) = J_local(sending_preamble_MTCD_idxs) - 1;
        sending_preamble_MTCD_idxs = J_validity_check(J_local,sending_preamble_MTCD_idxs);

        % activated MTCDs choose preamble code 
        [succeed_to_send_MTCD_idxs, fail_to_send_MTCD_idxs] = preamble_code_uniqueness_check(sending_preamble_MTCD_idxs,N_p);
        % those who fail to send unique preamble code should send codes later.
        delays = randi([1,4],size(fail_to_send_MTCD_idxs));
        sending_preamble_time(fail_to_send_MTCD_idxs) = time_slot_idx + delays;

        % those succeed to send unique preamble code will face the SNR check
        SNR_threshold = 2^R_0 - 1;
        [succeed_to_access_MTCD_idxs, fail_to_access_MTCD_idxs] = SNR_threshold_check(succeed_to_send_MTCD_idxs,target_SNR,SNR_threshold);
        delays = randi([1,4],size(fail_to_access_MTCD_idxs));
        sending_preamble_time(fail_to_access_MTCD_idxs) = time_slot_idx + delays;

        accessed_time(succeed_to_access_MTCD_idxs) = time_slot_idx;
        accessed_number = sum(accessed_time ~= 0);
        if (accessed_number + sum(J_local < 0)) == N_D
            is_done = 1;
            % evalute
            total_service_time(N_D_idx) = time_slot_idx;
            average_throughput(N_D_idx) = accessed_number / time_slot_idx;
            access_delay = accessed_time - first_activate_time;
            access_delay(access_delay < 0) = []; % delete those failed
            average_access_delay(N_D_idx) = mean(access_delay);
        end
        time_slot_idx = time_slot_idx + 1;
    end
    N_D_idx
end

figure(1)
plot(N_D_array,total_service_time,'DisplayName','total service time:R_0=1');
beautify_figure();

figure(2)
plot(N_D_array,average_throughput,'DisplayName','average throughput:R_0=1');
beautify_figure();

figure(3)
plot(N_D_array,average_access_delay,'DisplayName','average access delay:R_0=1');
beautify_figure();

csvwrite([filename_prefix,'TST.csv'], total_service_time);
csvwrite([filename_prefix,'AT.csv'], average_throughput);
csvwrite([filename_prefix,'AAD.csv'], average_access_delay);

function beautify_figure()
    grid on 
    legend
end

function [success_MTCD_idxs,failure_MTCD_idxs] = SNR_threshold_check(total_MTCD_idxs, target_SNR, SNR_threshold)
    mu = 2;
    channel_gains = exprnd(mu,size(total_MTCD_idxs));
    channel_gains = channel_gains * target_SNR;
    success_MTCD_idxs = total_MTCD_idxs(channel_gains >= SNR_threshold);
    failure_MTCD_idxs = total_MTCD_idxs(channel_gains < SNR_threshold);
end

function [success_MTCD_idxs, failure_MTCD_idxs] = preamble_code_uniqueness_check(total_MTCD_idxs,N_p)
    codes_chosen = randi([1,N_p],size(total_MTCD_idxs));
    [codes_unique,success_MTCD_idxs,~] = unique(codes_chosen); 
    codes_chosen = codes_chosen';
    failure_mask = sum(codes_unique == codes_chosen) - 1; % it's a row vector
    success_MTCD_idxs = success_MTCD_idxs' .* (~failure_mask); 
    success_MTCD_idxs(success_MTCD_idxs == 0) = [];
    success_MTCD_idxs = total_MTCD_idxs(success_MTCD_idxs);
    failure_MTCD_idxs = setdiff(total_MTCD_idxs,success_MTCD_idxs);
end

function idx = J_validity_check(J_local,pre_idx)
    J_exceed_mask = J_local(pre_idx) < 0;
    idx = pre_idx .* (~J_exceed_mask);
    idx(idx == 0) = [];
end





