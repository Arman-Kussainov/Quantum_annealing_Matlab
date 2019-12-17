close all; clear all; clc;
N1=40;N2=40;

s=round(rand(N1,N2)); s_copy=s;

figure(1);
subplot(2,2,[1 3]);
imagesc(s); axis equal;hold on;

j=ceil(rand*N1);i=ceil(rand*N2);
v_alue=s(j,i);

visited_added=zeros(2,N1*N2);

visited_added(1,1)=i;
visited_added(2,1)=j;
s_copy(j,i)=5;
h_its=1;

figure(1);

subplot(2,2,2)
imagesc(s);axis equal;
subplot(2,2,4)
imagesc(s_copy);axis equal;  

subplot(2,2,[1 3]);                
plot(i,j,'rp');hold on;

next_start=1;
next_end=1;

while next_start<=next_end
%for k=1:N1*N2
    

    s_hift=0;
    for l=next_start:next_end
        
        i=visited_added(1,l);
        j=visited_added(2,l);
        f=four_pattern(i,j,v_alue,h_its,visited_added,s);
        
        for ff=1:4
            if (f(1,ff)~=0)&&(f(2,ff)~=0)
                h_its=h_its+1;
                s_hift=s_hift+1;
                
                visited_added(1,h_its)=f(1,ff);
                visited_added(2,h_its)=f(2,ff);                      
               
                s_copy(f(2,ff),f(1,ff))=5;

                subplot(2,2,[1 3]);
                plot(f(1,ff),f(2,ff),'ro');hold on;
                subplot(2,2,4);
                imagesc(s_copy);axis equal;
                title(h_its);drawnow;  
            end
        end
        
    end

    next_start=next_end+1
    next_end=next_start+s_hift-1
    
    %visited_added
    %pause
   
end