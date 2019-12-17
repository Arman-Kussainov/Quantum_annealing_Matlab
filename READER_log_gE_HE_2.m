close all; clear all; clc;
load long_data.txt
m=16
n=16
n_odes=m*n*4+1
ntasks=8
ntasks*n_odes
length(long_data(:,2))
l_ow=-2;
u_pper=0;
over_lap=0.5*(u_pper-l_ow)/ntasks
flag=1;
for i=1:ntasks
	
	for j=1:n_odes
		if long_data((i-1)*n_odes+j,2)~=0
			if flag~=0
				non_zero=long_data((i-1)*n_odes+j,2);flag=0;
			end
			subplot(2,1,1); title(non_zero)
			plot(j,long_data((i-1)*n_odes+j,2)-non_zero,'r.');drawnow;hold on;
			
			subplot(2,1,2)
			if (j<n_odes)&&(long_data((i-1)*n_odes+j+1,2)!=0)&&...
							(long_data((i-1)*n_odes+j+2,2)!=0)&&...
							(long_data((i-1)*n_odes+j+3,2)!=0)&&...
							(long_data((i-1)*n_odes+j+4,2)!=0)
				plot(j,(long_data((i-1)*n_odes+j+4,2)-long_data((i-1)*n_odes+j,2))/4,'b.');drawnow;hold on;
			end
		end
	end
	
	flag=1;
end
grid on;
subplot(2,1,1);title("g(E)");
subplot(2,1,2);title("d(g((E))/d(j)");

pause
stop

plot(long_data(:,2));

pause














stop
load('log_gE_HE.txt')
subplot(2,1,1)
d_ata=log_gE_HE(:,2);
%m_in=min(d_ata(d_ata~=0));
%d_ata=log_gE_HE(:,2)-m_in;
%d_ata(d_ata<0)=0;
%bar(log_gE_HE(:,1),d_ata);
bar(log_gE_HE(:,1),d_ata);
%axis square;
axis tight;

subplot(2,1,2)
bar(log_gE_HE(:,1),log_gE_HE(:,3));
%axis square;
axis tight;

pause
