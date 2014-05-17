function U = getNewU(u, alpha, c, lambda, sigma, T, N_int)
	norm = normrnd(0, 1/sqrt(N_int), N_int*T+1, 1);
	W = cumsum(norm);
    U = sigma * W + getU(u, alpha, c, lambda, T, N_int);
end
