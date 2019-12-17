close all; clear all; clc;
m=4;n=4;J=1;
for i=1:123
I=2*round(rand(m,n))-1;
I_1=[I(:,n),I,I(:,1)];
I_2=[I_1(m,:);I_1;I_1(1,:)];
e_nergy(I_2,m,n,J)/(m*n)
end
