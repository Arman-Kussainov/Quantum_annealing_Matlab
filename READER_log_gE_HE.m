close all; clear all; clc;
load('log_gE_HE.txt')

subplot(2,1,1)
d_ata=log_gE_HE(:,2);
plot(log_gE_HE(:,1),d_ata,'r.-');axis tight;

subplot(2,1,2)
bar(log_gE_HE(:,1),log_gE_HE(:,3));
axis tight;

%pause
