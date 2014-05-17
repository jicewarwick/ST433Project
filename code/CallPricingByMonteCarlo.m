function sim_call_price = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim)
	for	i = 1:N_sim
		GB(i,:) = GeometricBrownianMotion(S0, r, sigma, T, N_sim);
		ST(i) = GB(i, T*N_sim+1);
		Callval(i) = exp(-r*T) * CallValue(ST(i), K);
	end

	sim_call_price = mean(Callval);
end
