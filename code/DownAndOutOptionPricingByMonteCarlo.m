function sim_down_and_out_option_price = DownAndOutOptionPricingByMonteCarlo(S0, r, sigma, K, barrier, T, N_sim)
	for	i = 1:N_sim
		GB(i,:) = GeometricBrownianMotion(S0, r, sigma, T, N_sim);
		down_and_out_option_val(i) = exp(-r * T) * DownAndOutOptionValue(GB(i), K, barrier);
	end

	sim_down_and_out_option_price = mean(down_and_out_option_val);
end
