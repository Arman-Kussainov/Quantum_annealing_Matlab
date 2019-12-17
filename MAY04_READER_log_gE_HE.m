%close all;
clear all; clc;
load('log_gE_HE.txt')


c_olor=['k*' 'rp' 'go' 'bv' 'm^' 'c*'];
co_lor=c_olor(1+round(rand*5));

%subplot(2,1,1)
figure(1)
d_ata=log_gE_HE(:,2);
for i=1:length(d_ata)
	if d_ata(i)~=0
%		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
%		axis square;axis tight;
	end
end
title('g(E)')

%subplot(2,1,2)
figure(2)
d_ata=log_gE_HE(:,3);
for i=1:length(d_ata)
	if d_ata(i)~=0
%		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
%		axis square;axis tight;
	end
end
title('H(E)');
ylabel('ln[g(E)]');
xlabel('E/N');


% stitching procedure
ntasks=log_gE_HE(1,3);
%ntasks=8;
n_odes=floor(length(log_gE_HE(:,1))/ntasks)


for i=2:ntasks
	% find the index of the first nonzero_right element in the data subset...
	non_zero_right=i*n_odes;
	for j=1:n_odes-1 % moving backward through subset
		if log_gE_HE(i*n_odes-j,2)~=0
			non_zero_right=i*n_odes-j;
		end
	end

	s_hift=log_gE_HE(non_zero_right-n_odes,2)-log_gE_HE(non_zero_right,2)

	% rise/lower the whole RIGHT subset of data according to the findings of the previous loop
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+s_hift;
		end
	end
end


figure(3)

sub_truct=0;
for i=1:length(d_ata)
if d_ata(i)~=0
sub_truct=d_ata(i);break;
end
end


d_ata=log_gE_HE(:,2);
points_counter=0;
for i=1:length(d_ata)
	points_counter=points_counter+1;
	if mod(points_counter,n_odes)==0
		co_lor=c_olor(1+round(rand*5))
	end
	if d_ata(i)~=0
%		plot(log_gE_HE(i,1),d_ata(i)-199993,co_lor);hold on;drawnow;	
		plot(log_gE_HE(i,1),d_ata(i)-d_ata(1),co_lor);hold on;drawnow;
%		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
%		plot(log_gE_HE(i,1),d_ata(i)/d_ata(1),co_lor);hold on;drawnow;
		axis square;axis tight;
	end
end
title('g(E)')
ylabel('ln[g(E)]');
xlabel('E/N');

%print -deps -color single_cluster.eps
%print -dpng -color single_cluster.png
