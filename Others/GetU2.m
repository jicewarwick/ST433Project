function[U] = GetU2(u,c,alpha,lambda,sigma,T)
     Nt = PPGenerate(T,lambda);
     Y = ExpGenerate(Nt(T+1),alpha);
     U = NaN((T+1),1);
     U(1) = u;
     
     N = normrnd(0,1,T,1);
     W = NaN(T+1,1);
     W(1) = 0;
     for i = 1:(T+1)
         W(i) = W(i-1)+N(i-1);
     end 
          
     for t = 2:(T+1)
         if U(t-1)>0
             YS = 0;
             for j = 1:Nt(t)
                 YS = YS+Y(j);
             end
             U(t) = u+c*(t-1)+sigma*W(t)-YS;
         else
             U(t) = U(t-1);
         end
     end
         