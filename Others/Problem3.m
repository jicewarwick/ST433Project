%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Problem 3
clc; clear all; clf;

%% Question 1
%By inverse transform method 
Exp = ExpGenerate(1000,1);
figure(1);
hist(Exp,100);

%% Question 2
U1 = GetU(500,0.7,0.5,1,10);
plot(U1);








%% Question 3. T=1.

u = 2; alpha = 0.5; c = 0.8; lambda = 1;
T1 = 1;  
n = 1000;
SM1 = NaN(n,T1+1);

for i = 1:n
    SM1(i,:) = GetU(u,c,alpha,lambda,T1);
end

Tau1 = GetTau(SM1);

%% Question 3. T=5.
T2 = 5;
SM2 = NaN(n,T2+1);

for i = 1:n
    SM2(i,:) = GetU(u,c,alpha,lambda,T2);
end

Tau2 = GetTau(SM2);

P = NaN(1,T2);

for i = 2:(T2+1)
    I = find(Tau2==(i-1));
    [s ~] = size(I);
    P(1,(i-1)) = s/n;
end

%% Question 3. T=10.
T3 = 10;










%% Question 4
alpha = 4; lambda = 2; c = 0.05; T = 5;
u1 = 0.5; u2 = 2; u3 = 4;
n = 1000;

SM1 = NaN(n,T1+1);

for i = 1:n
    SM1(i,:) = GetU(u1,c,alpha,lambda,T);
end

Tau1 = GetTau(SM1);

SMT = NaN(n,1);

for i = 1:n
    SMT(i) = -SM1(i,Tau1(i)+1);
end

hist(SMT,100);


%% Question 5
U = GetU2(u,c,appha,lambda,sigma,T);









%% Question 6











%% Question 7
















