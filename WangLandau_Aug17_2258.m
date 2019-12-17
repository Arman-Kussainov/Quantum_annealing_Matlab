% August 11, 2016 // Wang Landau algorithm for 2D Ising model
close all; clear all; clc;

m=4;n=4;J=1;

% In order to incorporate periodic boundaries
% I'm adding the copy of the top row to the bottom, the copy of the bottom row to the top
% and do the same procedure with the left and right boundaries.
% in this case I do not have to test if the randomly selected spin is on the boundary to calculate the energy of this site by formula
% E=E+s(i,j)*(s(i-1,j)+s(i+1,j)+s(i,j+1)+s(i,j-1));
I0=2*round(rand(m,n))-1;
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

% energy associated with the current I_2 configuration of spins
E1=e_nergy(I_2,m,n,J);
% its location  in the EpN spectrum is given by i_ndex1 
[v_alue,i_ndex1]=min(abs(EpN-E1));

c_ount=0;
while c_ount<=10000*m*n+1
	
	% keeping track of the old spin configuration
	  I_old=I0;
	% selecton of a single random spin and its flip
	  ii=1+round(rand*(m-1)); jj=1+round(rand*(n-1));
	  I0(ii,jj)=-I0(ii,jj);

	  I_1=[I0(:,n),I0,I0(:,1)];
	  I_2=[I_1(m,:);I_1;I_1(1,:)];
	% calclating energy of the new configuration
	  E2=e_nergy(I_2,m,n,J);
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

	L=H_E(H_E~=0);R_L=mean(L)/max(L);
%	if sum(log_gE(1:60)>0) && (R_L)>=0.80
	if c_ount>=2000 && (R_L)>=0.80
	save log_gE log_gE H_E f;
		H_E=H_E*0;
		f=sqrt(f);
		c_ount=0;
	end

	% plotting the data
	figure(1)

	subplot(2,1,1)
	bar(EpN(:)/(m*n),log_gE(:),'rp-');
	title(strcat( num2str(c_ount),"--",num2str(E1/(m*n)),"--",num2str(EpN(i_ndex1)/(m*n)),"--",num2str(R_L) ));
	ylabel('g(E)');xlabel('E/N');drawnow;

	subplot(2,1,2)
	bar(EpN(:)/(m*n),H_E(:),'rp-'); ylabel('H(E)');xlabel('E/N');drawnow;


c_ount=c_ount+1;	
end
