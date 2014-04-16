function[N] = PPGenerate(Time,lambda)
       
     T = NaN;
     T(1) = 0;
     i = 1;
     while T(i) < Time
         T(i+1) = T(i)+ExpGenerate(1,lambda);
         i = i+1;
     end
     
     N = NaN((Time+1),1);
     N(1) = 0;
     k = 2;
     for t = 2:(Time+1)
         N(t) = N(t-1);
         while T(k)<(t-1)
             N(t) = N(t)+1;
             k = k+1;
         end
     end
     
     
     
     
             
             
            
     
 