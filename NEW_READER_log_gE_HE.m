close all;
 clear all; clc;
load('log_gE_HE.txt')

%subplot(2,1,1)
figure(1)
d_ata=log_gE_HE(:,2);
plot(log_gE_HE(:,1),d_ata,'r.');axis square;axis tight;

%subplot(2,1,2)
figure(2)
plot(log_gE_HE(:,1),log_gE_HE(:,3),'b.');
axis square;axis tight;

% stitching procedure
%ntasks=log_gE_HE(1,3);
ntasks=8;
n_odes=floor(length(log_gE_HE(:,1))/ntasks)

for i=2:ntasks
	% find the index of the first nonzero element
	non_zero=i*n_odes;
	for j=1:n_odes-1
		if log_gE_HE(i*n_odes-j,2)~=0
			non_zero=i*n_odes-j;
		end
	end
	% rise the whole subset of data according to the findings of the previous loop
	stitch_point=2;
	non_zero=non_zero+stitch_point;
	
	r_ise=log_gE_HE(non_zero-n_odes,2)-log_gE_HE(non_zero,2);
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+r_ise;
		end
	end
end

figure(3)

d_ata=log_gE_HE(:,2);
%plot(log_gE_HE(:,1),d_ata,'r.');axis square;axis tight;
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),'r.');drawnow;hold on;
	end
end
axis tight;

%pause
