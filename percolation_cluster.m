clear all; clc; close all; 
N1=40;N2=40;

p=rand(N1,N2);
s=round(p); % 010101 matrix
s_copy=s;

figure(1);
subplot(2,2,[1 3]);
imagesc(s); axis equal;hold on;

% choose a seed site
j=ceil(rand*N1);i=ceil(rand*N2);
% learn its value
v_alue=s(j,i);

visited_added=zeros(2,N1*N2);

% add to the visited_added list
visited_added(1,1)=i;
visited_added(2,1)=j;

index_i=i;
index_j=j;
% visited sites counter
h_its=1;

s_copy(j,i)=5;

figure(1);
subplot(2,2,2)
imagesc(s_copy);axis equal;
subplot(2,2,4)
imagesc(s);axis equal;  

subplot(2,2,[1 3]);                
plot(i,j,'rp');hold on;

next_start=1;
next_end=1;

o_ld=1; n_ew=2;
% good conception...
while o_ld~=n_ew
    s_hift=0;
    
    m_in=1;
    for lc=next_start:next_end
        i=visited_added(1,lc);
        j=visited_added(2,lc);
 
        f=four_pattern_percol(i,j,v_alue,h_its,visited_added,s);
       
        for ff=1:4
            if (f(1,ff)~=0)&&(p(f(1,ff),f(2,ff))<m_in)
                m_in=p(f(1,ff),f(2,ff));
                index_i=f(1,ff);
                index_j=f(2,ff);
            end            
        end
       
        
    end
    
    if m_in~=1
        s_copy(index_j,index_i)=5;
        subplot(2,2,[1 3]);
        plot(index_i,index_j,'ro'); hold on;
        subplot(2,2,4);
        imagesc(s_copy);axis equal;
        title(h_its);drawnow;      
        
        h_its=h_its+1;
        s_hift=s_hift+1;
        
        visited_added(1,h_its)=index_i;
        visited_added(2,h_its)=index_j;                
        
       % next_start=next_end+1;
        next_end=next_end+s_hift;
    end
    %visited_added
    %pause(.5)
    o_ld=n_ew;
    n_ew=sum(visited_added(1,:));
end

%subplot(2,2,[1 3]);
%for i=1:N1
%    for j=1:N2
%    text(i,j, num2str(p(i,j)) );hold on;
%    end
%end