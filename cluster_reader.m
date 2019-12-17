close all; clear all; clc;

figure(1);

figure(2)
load "cluster.txt"
m=64;n=64;
cluster_image=zeros(m,n);
		
		for j=1:n
			for i=1:m
				cluster_image(i,j)=cluster(i+(j-1)*n);
			end
		end

E=cluster_image(1,1);
cluster_image(1,1)=cluster_image(1,2);
imagesc(cluster_image);axis square;colorbar;
title(strcat("E=",num2str(E)));

print -deps -color single_cluster.eps

figure(1);
load "cluster_0.txt"
m=64;n=64;
cluster_image=zeros(m,n);
		
		for j=1:n
			for i=1:m
				cluster_image(i,j)=cluster_0(i+(j-1)*n);
			end
		end

E=cluster_image(1,1);
cluster_image(1,1)=cluster_image(1,2);
imagesc(cluster_image);axis square;colorbar;
title(strcat("E=",num2str(E)));

pause;
