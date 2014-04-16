function U = getNewU(u, alpha, c, lambda, sigma, T, N)
    time = 0:1/N:T - 1/N;
	norm = normrnd(0, 1, N*T, 1);
	W = cumsum(norm);
    U = u + c * time' + sigma * W - CompoundPoissonGenerator(lambda, alpha, T, N);

end
