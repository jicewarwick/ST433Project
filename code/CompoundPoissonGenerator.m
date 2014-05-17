function coumpoundPoisson = CompoundPoissonGenerator(lambda, alpha, T, N_int)
	delta_coumpound_poisson = zeros(T*N_int+1, 1);
	t = exprnd(lambda);
	while (t < T)
		delta_coumpound_poisson(ceil(t*N_int)) = exprnd(alpha);
		t = t + exprnd(lambda);
	end

	coumpoundPoisson = cumsum(delta_coumpound_poisson);
end
