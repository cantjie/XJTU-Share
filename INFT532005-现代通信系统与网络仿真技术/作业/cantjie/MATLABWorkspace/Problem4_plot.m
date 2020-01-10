% only to plot for Problem4
clear,clc

N_D_array = 3e3:3e3:3e4;
filename_prefix = 'P4_R_0_1_';
tst_1 = csvread([filename_prefix,'TST.csv']);
at_1 = csvread([filename_prefix,'AT.csv']);
aad_1 = csvread([filename_prefix,'AAD.csv']);

filename_prefix = 'P4_R_0_2_';
tst_2 = csvread([filename_prefix,'TST.csv']);
at_2 = csvread([filename_prefix,'AT.csv']);
aad_2 = csvread([filename_prefix,'AAD.csv']);

figure(1);clf;
plot(N_D_array,tst_1,'.-','DisplayName','total service time:R_0=1');
hold on 
plot(N_D_array,tst_2,'*-','DisplayName','total service time:R_0=2');
title('total service time');
ylabel('numbers of RAO time slot');
beautify_figure();

figure(2);clf;
plot(N_D_array,at_1,'.-','DisplayName','average throughput:R_0=1');
hold on
plot(N_D_array,at_2,'*-','DisplayName','average throughput:R_0=2');
title('average throughput');
beautify_figure();

figure(3);clf;
plot(N_D_array,aad_1,'.-','DisplayName','average access delay:R_0=1');
hold on
plot(N_D_array,aad_2,'*-','DisplayName','average access delay:R_0=2');
title('average access delay');
beautify_figure();

function beautify_figure()
    xlabel('amount of MTCDs');
    grid on 
    legend
end