% Aug09 2016, 2D Ising model
function E=energy_p(s,cos_theta,m,n,J)
E=0;
for ii=2:m+1
	for jj=2:n+1
		E=E+cos_theta(s(ii,jj),s(ii-1,jj))+cos_theta(s(ii+1,jj),s(ii,jj))...
		   +cos_theta(s(ii,jj),s(ii,jj-1))+cos_theta(s(ii,jj),s(ii,jj+1));
	end
end
E=E/2*J;
