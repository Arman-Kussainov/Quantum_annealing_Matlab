% Aug09 2016, 2D Ising model
function E=e_nergy(s,m,n,J)
E=0;
for ii=2:m+1
	for jj=2:n+1
		E=E+s(ii,jj)*(s(ii-1,jj)+s(ii+1,jj)+s(ii,jj+1)+s(ii,jj-1));
	end
end
E=E/2*J;


