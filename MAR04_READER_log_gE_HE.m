close all;
clear all; clc;
load('log_gE_HE.txt')



c_olor=['k.-' 'r.-' 'g.-' 'b.-' 'm.-' 'c.-'];
co_lor=c_olor(1+round(rand*5));

%subplot(2,1,1)
figure(1)
d_ata=log_gE_HE(:,2);
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
		axis square;axis tight;
	end
end
title('g(E)')

%subplot(2,1,2)
figure(2)
d_ata=log_gE_HE(:,3);
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
		axis square;axis tight;
	end
end
title('H(E)')


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

log_gE_HE(non_zero_right,2);

	% find the index of the first nonzero_left element in the data subset...
	non_zero_left=(i-1)*n_odes;
	for j=1:n_odes-1 % still moving backward through the adjacent subset
		if log_gE_HE((i-1)*n_odes-j,2)~=0
			non_zero_left=(i-1)*n_odes-j;
			break;
		end
	end

log_gE_HE(non_zero_left,2);

	s_hift=log_gE_HE(non_zero_left,2)-log_gE_HE(non_zero_right,2)


	% rise/lower the whole RIGHT subset of data according to the findings of the previous loop
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+s_hift;
		end
	end
end

figure(3)
d_ata=log_gE_HE(:,2);
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),co_lor);hold on;drawnow;
		axis square;axis tight;
	end
end
title('g(E)')
