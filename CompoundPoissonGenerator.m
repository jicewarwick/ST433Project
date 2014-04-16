function coumpoundPoisson = CompoundPoissonGenerator(lambda, alpha, T, N)
	coumpoundPoisson = zeros(T*N, 1);
	t = 0;
	Y = 0;
	index = 1;
	while (t < T)
		tnext = t + exprnd(lambda);
		for	time = index/N:1/N:min(tnext, T)
			coumpoundPoisson(index) = Y;
			index = index + 1;
		end
		t = tnext;
		Y = Y + exprnd(alpha);
	end
end
