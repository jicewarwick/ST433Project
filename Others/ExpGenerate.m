function[Exp] = ExpGenerate(n,lambda)
     U = unifrnd(0,1,n,1);
     Exp = NaN(n,1);
     for i = 1:n
         Exp(i,1) = -(1/lambda)*log(1-U(i));
     end     