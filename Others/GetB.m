function[B] = GetB(n)
     N = normrnd(0,1,n,1);
     B = NaN(n,1);
     B(1) = N(1,1);
     for i = 2:n
         B(i) = B(i-1)+N(i);
     end
     