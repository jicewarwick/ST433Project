function[X] = GetBankPath(a,N,T)
     NormR = normrnd(0,1,T,N);
     X1= NaN(T,N);
      
 for i = 2:11
     for j = 1:10
         X1(i,j) = X1(i-1,j)+a1*(Xt1(i-1,1)-X1(i-1,j))*1+sigma*NormR1(i-1,j);
     end
     Xt1(i,1) = sum(X1(i,:))/N;
 end
 
 Xt1 = NaN(11,1);
 Xt1(1) = sum(X1(1,:))/N;