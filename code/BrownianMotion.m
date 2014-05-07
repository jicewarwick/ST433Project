function B = BrownianMotion(X0, mu, sigma, T, N)
	B = X0 * ones(T*N+1, 1);
	t = 0:1/N:T;
	W = normrnd(0, 1/sqrt(N), N*T+1, 1);
	W = cumsum(W);
	B = B + t' + W;
end
