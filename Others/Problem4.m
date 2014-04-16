 %% Problem 4
 clc; clear all; clf;
 sigma = 1;
 
 %% Question 1
 N = 10; a1 = 0;
 
 
 
%%

 a2 = 10;
 NormR2 = normrnd(0,1,10,10);
 
 X2 = NaN(11,10);
 X2(1,:) = 0;
 Xt2 = NaN(11,1);
 Xt2(1) = sum(X2(1,:))/N;
 
 for i = 2:11
     for j = 1:10
         X2(i,j) = X2(i-1,j)+a2*(Xt2(i-1,1)-X2(i-1,j))*1+sigma*NormR2(i-1,j);
     end
     Xt2(i,1) = sum(X2(i,:))/N;
 end
 
 plot(X2(:,1));
 
 