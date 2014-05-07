function call_price = CallPricingByBSFormula(r, sigma, spot, K, t, T)
	d1 = (log( spot/K ) + (r + sigma^2 / 2) * (T-t)) / sigma / sqrt(T-t);
	d2 = d1 - sigma * sqrt(T-t);
	call_price = normcdf(d1) * spot - normcdf(d2) * K * exp(-r * (T-t));
end
