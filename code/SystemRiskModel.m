function process = SystemRiskModel(X0, a, sigma, N, T, N_int)
	X_bar = 0;
	% initialisation:
	for	i = 1:N
		process(1,i) = X0;
	end

	for	j = 2:T*N_int
		for i = 1:N
			process(j,i) = process(j-1,i) + a * (X_bar - process(j-1,i)) / N_int;
			process(j,i) = process(j,i) + sigma / sqrt(N_int) * normrnd(0,1);
		end
		X_bar = sum(process(j,:)) / N;
	end
end
