function implied_vol = getImpliedVolatility(r, spot, K, t, T, heston_price)
	options = optimset('Display','off');
	N_sim = size(heston_price');
	for	i = 1:N_sim
		implied_vol(i) = fsolve(@(BS_vol) CallPricingByBSFormula(r, BS_vol, spot, K(i), t, T), heston_price(i), options);
	end
	implied_vol = implied_vol .^ 2;
end
