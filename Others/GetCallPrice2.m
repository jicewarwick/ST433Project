function[C0] = GetCallPrice2(K,St,r,j)
     [n,m] = size(St);
     Ct = NaN(m,2);
     for i = 1:m
         if St(j,i) > K
             Ct(i,2) = St(j,i)-K;
         else
             Ct(i,2) = 0;
         end
         Ct(i,1) = exp(-r*j/n)*Ct(i,2);
     end
     C0 = sum(Ct(:,1))/m;