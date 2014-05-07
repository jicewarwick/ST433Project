function sim_call_price = HestonCallPricingByMonteCarlo(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int, N_sim)
	for	i = 1:N_sim
		St = getHestonSimulation(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int);
		Callval(i) = exp(-r*T) * CallValue(St(T*N_int+1), K);
	end

	sim_call_price = mean(Callval);
end
