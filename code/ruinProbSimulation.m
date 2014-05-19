function ruinProb = ruinProbSimulation(u, alpha, c, lambda, T, N, N_sim)
	ruinedCase = 0;
	for	i = 1:N_sim
		U = getU(u, alpha, c, lambda, T, N);
		ruinedCase = ruinedCase + (isRuined(U) ~= 0);
	end
	ruinProb = ruinedCase / N_sim;
end
