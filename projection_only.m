close all; clear all;clc;

figure(3);
% Find out number of rows in file
row_count=0; end_of_file=0;
fid = fopen('compare_mu_data.txt','rt');
% Loop through data file until we get a -1 indicating EOF
while(end_of_file~=(-1))
        end_of_file=fgetl(fid);
        row_count=row_count+1;
end
row_count = row_count-1;
% rewind file reader head back to the begining of the file
frewind(fid);
for i = 1:row_count
      name = fscanf(fid,'%s',1); % find the name of the element written at the begining of each row
      
      num = fscanf(fid,'%f\n')'; % Read in mu and E values intermittently
      
      if(i==1)
        names = name; % Add 1st text string
        mu_data = num; % Add 1st row
      else
        names = str2mat(names,name); % Add next string
        mu_data = [mu_data;num]; % Add additional rows
      end
end
fclose(fid);

subplot(2,1,1)
c_ount=1;
for i=1:2:row_count
    plot(mu_data(i,:),mu_data(i+1,:),'Color',[rand rand rand],'LineWidth',3);
    hold on;
    xlabel('log(E)');ylabel('log(\mu)');
    names(c_ount,:)=[];c_ount=c_ount+1;
end
title('interpolated \mu data');legend(names);grid on;
axis([0 140 0 max(max(mu_data))]);

subplot(2,1,2)
load('spectrum.txt');
plot(spectrum(:,1),spectrum(:,2),'bo-');
axis([0 140 0 max(max(spectrum))]);
hold on;

%figure(4);
%load projection_0.txt;
%imagesc(projection_0);
%axis equal;axis tight;
%colormap('gray');
%colorbar;
%ylabel('X');xlabel('Z'); % :)