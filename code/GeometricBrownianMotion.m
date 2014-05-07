function GB = GeometricBrownianMotion(S0, r, sigma, T, N)
	GB = S0 * ones(T*N+1, 1);
	t = (0:1/N:T) * (r - 0.5 * sigma ^ 2) ;
	W = normrnd(0, 1/sqrt(N), N*T+1, 1);
	W = cumsum(W);
	GB = GB .* exp( t' + sigma * W );
end
