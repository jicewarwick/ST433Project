function coumpoundPoisson = CompoundPoissonGenerator(lambda, alpha, T, N)
	coumpoundPoisson = zeros(T*N, 1);
	t = 0;
	Y = 0;
	index = 1;
	while (t < T)
		Y = Y + exprnd(alpha);
		tnext = t + exprnd(alpha);
		for	i = index/N:1/N:min(tnext, T)
			coumpoundPoisson(index) = Y;
			index = index + 1;
		end
		t = tnext;
	end
end
