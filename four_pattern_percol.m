function [ f ] =four_pattern_percol( i,j,v_alue,l_ength, l_ist,s )
f=zeros(2,4);
[N1,N2]=size(s);

c_ount=1;
for j1=j-1:j+1
	for i1=i-1:i+1
	
		if(abs(j1+i1-j-i)~=2&&abs(j1+i1-j-i)~=0)
	
			if(j1>0)&&(j1<=N2)&&(i1>0)&&(i1<=N1)
				e_st=0;
				if s(i1,j1)==v_alue
                % check if the site was added...
					for ii=1:l_ength 
						if (i1==l_ist(1,ii))&&(j1==l_ist(2,ii))
							e_st=1;
						end
					end
					if e_st~=1
						f(1,c_ount)=i1;
						f(2,c_ount)=j1;
						c_ount=c_ount+1;
					end
					
				end
				
			end
	
		
		end
	end
end
