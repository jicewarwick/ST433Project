function stock_process = getHestonSimulation(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int)
	dB1 = normrnd(0, ones(T*N_int+1, 1) * sqrt(1/N_int));
	dB2 = normrnd(0, ones(T*N_int+1, 1) * sqrt(1/N_int));
	
	Vt = zeros(T*N_int+1, 1);
	Vt(1) = V0;
	for	i = 1:T*N_int
		Vt(i+1) = Vt(i) + alpha * (beta - Vt(i)) / N_int + gamma * sqrt(Vt(i)) * dB1(i);
		Vt(i+1) = max(Vt(i+1), 0);
	end

	stock_process = S0 * ones(T*N_int+1, 1);
	dW = rho * dB1 + sqrt(1 - rho^2) * dB2;
	W = cumsum(dW);
	t = (0:1/N_int:T)' .* ( - Vt / 2 + r);
	stock_process = stock_process .* exp(t + sqrt(Vt) .* W);
end
