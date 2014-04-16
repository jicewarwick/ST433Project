function[W] = GetW(B,rho)
     [n ~] = size(B);
     Beta = GetB(n);
     W = NaN(n,1);
     for i = 2:n
         W(i) = rho*B(i)+sqrt(1-rho^2)*Beta(i);
     end
     