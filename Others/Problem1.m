%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%Problem 1
clc; clear all; clf;
S0 = 40; r = 0.03;
sigma1 = 0.1; sigma2 = 0.5; sigma3 = 0.9;

%% Question 2
n = 100;
ns = 1000;
N = normrnd(0,1,n,ns);
St1 = GetPath(n,ns,S0,r,sigma1,N);
St2 = GetPath(n,ns,S0,r,sigma2,N);
St3 = GetPath(n,ns,S0,r,sigma3,N);
figure(1);
hist((1/sigma1)*log(St1(n,:)),100);
figure(2);
hist((1/sigma1)*log(St2(n,:)),100);
figure(3);
hist((1/sigma1)*log(St3(n,:)),100);

%% Question 3
K = 40; 
C1 = GetCallPrice(K,St1,r);
C2 = GetCallPrice(K,St2,r);
C3 = GetCallPrice(K,St3,r);
      
%% Question 4. Maturity T Fixed 
% We are using sigma2 in this section. 
K1 = (20:1:60);
C0K = NaN(41,1);
for j = 1:41
    C0K(j,1) = GetCallPrice(K1(j),St2,r); 
end
figure(4);
plot(C0K);%%% Error somewhere!!

%% Qusetion 4. K Fixed
C0T = NaN(n,1);
for j = 1:n
    C0T(j,1) = GetCallPrice2(K,St2,r,j);
end
figure(5);
plot(C0T);


















