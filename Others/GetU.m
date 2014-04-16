function[U] = GetU(u,c,alpha,lambda,T)
     Nt = PPGenerate(T,lambda);
     Y = ExpGenerate(Nt(T+1),alpha);
     U = NaN((T+1),1);
     U(1) = u;
     
     for t = 2:(T+1)
         if U(t-1)>0
             YS = 0;
             for j = 1:Nt(t)
                 YS = YS+Y(j);
             end
             U(t) = u+c*(t-1)-YS;
         else
             U(t) = U(t-1);
         end
     end