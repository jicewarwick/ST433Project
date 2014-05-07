function sim_call_price = CallPricingByMonteCarlo(S0, r, sigma, K, T, N)
	for	i = 1:N
		GB(i,:) = GeometricBrownianMotion(S0, r, sigma, T, N);
		ST(i) = GB(i, T*N+1);
		Callval(i) = exp(-r*T) * CallValue(ST(i), K);
	end

	sim_call_price = sum(Callval) / N;
end
