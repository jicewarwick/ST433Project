clear;
n=1000;
mu=4;
sigma=1;
T=1;
m=T*250;
t=linspace(0,T,m+1);
h=t(2)-t(1);
dw=sqrt(h)*rand(m,n,'n'); //increments of brownian motion
w=cumsum([zeros(1,n);dw],1);
for i=1:n
   wmu(:,i)=mu * t' + sigma*w(:,i); //adding the drift and vol
end

a=0.10;
b=0.05;
c=1.5;
Gbm=zeros(m+1,n);
for i=1:n
    Gbm(:,i)=c*exp((b-0.5*a^2)*t'+a*w(:,i));
end
clf;
plot(t', Gbm)