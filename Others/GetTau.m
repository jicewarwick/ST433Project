function[Tau] = GetTau(SM)
     [n T] = size(SM);
     [R,C] = find(SM<0);
     [m ~] = size(R);
     Tau = NaN(n,1);
     for i = 1:m
         if SM(R(i),C(i)-1)>0
             Tau(R(i)) = C(i)-1;
         end
     end
     
     for i = 1:n
         if SM(i,T)>0
             Tau(i,1) = T-1;
         end
     end
     
             