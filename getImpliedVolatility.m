function implied_vol = getImpliedVolatility(r, spot, K, t, T, heston_price)
	[i, N_sim] = size(heston_price);
	for	i = 1:N_sim
		implied_vol(i) = fsolve(@(BS_vol) CallPricingByBSFormula(r, BS_vol, spot, K, t, T), heston_price(i));
	end
end
