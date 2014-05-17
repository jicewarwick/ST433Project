%generate volatility path
v(:,1)=zeros(n,1)+sigma1^2; 
lns(:,1)=zeros(n,1)+log(S0);
for j=1:n;% N_sim
for i=1:Nt; % N_int
    dv(j,i)=alpha*(beta-v(j,i))*dt+gamma*sqrt(v(j,i))*db1(j,i);
    v(j,i+1)=max(v(j,i)+dv(j,i),0);
        dlns(j,i)=(r-0.5*v(j,i))*dt+rho*sqrt(v(j,i))*db1(j,i)+sqrt(1-rho^2)*sqrt(v(j,i))*db2(j,i);
        lns(j,i+1)=lns(j,i)+dlns(j,i);
    end
end
s=exp(lns);

%%%%%%
K24=30:50;
t24=linspace(30,50,21);
for i=1:21
    for j=1:n
    Payoff24(i,j)=exp(-r)*max(s(j,251)-K24(i),0);
    end
    Price24(i)=mean(Payoff24(i,:));   
end
plot(t24,Price24);
title('European Call under Heston Model with varying Strike');
xlabel('Strike Price');
ylabel('Option Price');

%implied volatility
for i=1:21
volatility(i)=blkimpv(40,K24(i),0.03,1,Price24(i));
end
plot(K24,volatility);
title('Implied volatiltiy against strike');
xlabel('Strike Price');
ylabel('Implied Volatility');
