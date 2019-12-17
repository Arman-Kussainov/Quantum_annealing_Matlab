% August 11, 2016 // Wang Landau algorithm for 2D Ising model
close all; clear all; clc;

m=4;n=4;J=3/4;qq=10;

% 2D array of the precomputed cos(theta_j-theta_i) values
% makes program a little bit faster
cos_theta=zeros(qq,qq);
for t=1:qq
	for q=1:qq
		cos_theta(q,t)=cos(2*pi*(q-t)/qq);
	end
end

% In order to incorporate periodic boundaries
% I'm adding the copy of the top row to the bottom, the copy of the bottom row to the top
% and do the same procedure with the left and right boundaries.
% in this case I do not have to test if the randomly selected spin is on the boundary to calculate the energy of this site by formula
% E=E+s(i,j)*(s(i-1,j)+s(i+1,j)+s(i,j+1)+s(i,j-1));
I0=qq*ones(m,n);
I_1=[I0(:,n),I0,I0(:,1)];
I_2=[I_1(m,:);I_1;I_1(1,:)];


f=e;

% this are the number of energy levels from -J to +J "available to the system"
% of course some energy values are not accessible
n_odes=m*n*4+1;
EpN=linspace(-m*n*2,m*n*2,n_odes);

log_gE = zeros(1,n_odes);
H_E   = zeros(1,n_odes);
%load log_gE;

% energy associated with the current I_2 configuration of (m+2)x(n+2) spins
E1=energy_p(I_2, cos_theta, m, n, J);
% its location  in the EpN spectrum is given by i_ndex1 
[v_alue,i_ndex1]=min(abs(EpN-E1));

c_ount=0;
while c_ount<=10000000*m*n+1
	
	% keeping track of the old spin configuration
	  I_old=I0;
	% selecton of a single random spin and its flip value
	  ii=1+round(rand*(m-1)); jj=1+round(rand*(n-1));
	  nn =1+round(rand*(qq-1));	  
	  I0(ii,jj)=nn;
	  

	  I_1=[I0(:,n),I0,I0(:,1)];
	  I_2=[I_1(m,:);I_1;I_1(1,:)];
	% calclating energy of the new configuration
	  E2=energy_p(I_2,cos_theta,m,n,J);
	  [v_alue,i_ndex2]=min(abs(EpN-E2));
	
	% accepting configuration
	if exp(log_gE(i_ndex1)-log_gE(i_ndex2))>=rand
		log_gE(i_ndex2)=log_gE(i_ndex2)+log(f);
		H_E(i_ndex2)=H_E(i_ndex2)+1;
		i_ndex1=i_ndex2;
	% rejecting configuration
	else
		I0=I_old;
		log_gE(i_ndex1)=log_gE(i_ndex1)+log(f);
		H_E(i_ndex1)=H_E(i_ndex1)+1;
	end

	R_L=0;
	if (H_E(1)+H_E(4*m*n+1))>0 && (c_ount>=1000)
		L=H_E(H_E~=0);R_L=min(L)/max(L);
		if R_L>=0.85
			save log_gE_J34_qq10 log_gE H_E f m n;
			H_E=H_E*0;
			f=sqrt(f);
			c_ount=0;
			
			figure(1);
			subplot(2,1,1)
			m_in=min(log_gE(log_gE~=0));
			m_ax=max(log_gE(log_gE~=0));				
			bar(EpN/(m*n),log_gE-m_in*(log_gE~=0),'rp-');
			title(strcat(num2str(m_in),'--',num2str(m_ax),'--',num2str(f)));
			ylabel('g(E)');xlabel('E/N');drawnow;	
		end
	end

	% plotting the data
	figure(1)

%	subplot(2,1,1)
%	m_in=min(log_gE(log_gE~=0));
%	bar(EpN/(m*n),log_gE-m_in*(log_gE~=0),'rp-');		
%	bar(EpN(:)/(m*n),log_gE(:),'rp-');
%	title(num2str(m_in));
%	ylabel('g(E)');xlabel('E/N');drawnow;

	subplot(2,1,2)
	bar(EpN(:)/(m*n),H_E(:),'rp-'); ylabel('H(E)');xlabel('E/N');
	title(strcat( num2str(c_ount),'--',num2str(EpN(i_ndex1)/(m*n)),'--',num2str(R_L) ));
	drawnow;

c_ount=c_ount+1;	
end
