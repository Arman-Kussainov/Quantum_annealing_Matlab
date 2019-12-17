close all; clear all; clc;
load('2_16_16_80_0001_ising_log_gE_HE.txt')
log_gE_HE=X2_16_16_80_0001_ising_log_gE_HE;


figure(14)
d_ata=log_gE_HE(:,2);
plot(log_gE_HE(:,1),d_ata,'bp');axis square;axis tight;hold on
set(gca, "linewidth", 3, "fontsize", 14)

figure(1)
subplot(3,2,1)
plot(log_gE_HE(:,1),log_gE_HE(:,3),'bp');
hold on;
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,3))]);

% stitching procedure
%ntasks=log_gE_HE(1,3)
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
	%non_zero=non_zero+2;	
	r_ise=log_gE_HE(non_zero-n_odes,2)-log_gE_HE(non_zero,2);
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+r_ise;
		end
	end
end

figure(1)
subplot(3,2,2)
d_ata=log_gE_HE(:,2);
%plot(log_gE_HE(:,1),d_ata,'r.');axis square;axis tight;
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),'bp');drawnow;hold on;
	end
end
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,2))]);
%pause


 clear all; clc;
load('13_16_16_80_0001_potts_log_gE_HE.txt')
log_gE_HE=X13_16_16_80_0001_potts_log_gE_HE;

figure(14)
d_ata=log_gE_HE(:,2);
plot(log_gE_HE(:,1),d_ata,'ro');axis square;axis tight;
set(gca, "linewidth", 3, "fontsize", 14)

figure(1)
subplot(3,2,3)
plot(log_gE_HE(:,1),log_gE_HE(:,3),'ro');
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,3))]);

% stitching procedure
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
	non_zero=non_zero+2;	
	r_ise=log_gE_HE(non_zero-n_odes,2)-log_gE_HE(non_zero,2);
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+r_ise;
		end
	end
end

figure(1)
subplot(3,2,4)
d_ata=log_gE_HE(:,2);
%plot(log_gE_HE(:,1),d_ata,'r.');axis square;axis tight;
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),'ro');drawnow;hold on;
	end
end
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,2))]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 clear all; clc;
load('7_16_16_80_0001_clock_log_gE_HE.txt')
log_gE_HE=X7_16_16_80_0001_clock_log_gE_HE;

figure(14)
d_ata=log_gE_HE(:,2);
plot(log_gE_HE(:,1),d_ata,'g^');axis square;axis tight;
set(gca, "linewidth", 3, "fontsize", 14)

figure(1)
subplot(3,2,5)
plot(log_gE_HE(:,1),log_gE_HE(:,3),'g^');
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,3))]);

% stitching procedure
ntasks=8;
n_odes=floor(length(log_gE_HE(:,1))/ntasks)

for i=2:ntasks
	% find the index of the third nonzero element first may give an artifacts
	non_zero=i*n_odes;
	for j=1:n_odes-1
		if log_gE_HE(i*n_odes-j,2)~=0
			non_zero=i*n_odes-j;
		end
	end
	% rise the whole subset of data according to the findings of the previous loop
	non_zero=non_zero+2;
	r_ise=log_gE_HE(non_zero-n_odes,2)-log_gE_HE(non_zero,2);
	for j=1:n_odes
		if log_gE_HE((i-1)*n_odes+j,2)~=0
			log_gE_HE((i-1)*n_odes+j,2)=log_gE_HE((i-1)*n_odes+j,2)+r_ise;
		end
	end
end

figure(1)
subplot(3,2,6)
d_ata=log_gE_HE(:,2);
%plot(log_gE_HE(:,1),d_ata,'r.');axis square;axis tight;
for i=1:length(d_ata)
	if d_ata(i)~=0
		plot(log_gE_HE(i,1),d_ata(i),'g^');drawnow;hold on;
	end
end
set(gca, "linewidth", 3, "fontsize", 14)
axis([-2 0 0 max(log_gE_HE(:,2))]);
