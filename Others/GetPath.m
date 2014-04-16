function[St] = GetPath(n,m,S0,r,sigma,N)
    %m is the number of paths
    %n is the number of time lags
    %N the standard normal simulation matrix 
    St = NaN(n,m);
    for j = 1:m
        St(1,j) = S0*exp((r-sigma^2/2)*(1/n)+sigma*sqrt(1/n)*N(1,j));
        for i = 2:n
            St(i,j) = St(i-1,j)*exp((r-sigma^2/2)*(1/n)+sigma*sqrt(1/n)*N(i,j));
        end
    end
