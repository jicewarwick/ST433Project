function[C0] = GetCallPrice(K,St,r)
     [n,m] = size(St);
     Ct = NaN(m,2);
     for i = 1:m
         if St(n,i) > K
             Ct(i,2) = St(n,i)-K;
         else
             Ct(i,2) = 0;
         end
         Ct(i,1) = exp(-r)*Ct(i,2);
     end
     C0 = sum(Ct(:,1))/m;