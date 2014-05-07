function ruinProb = ruinProbSimulation(u, alpha, c, lambda, T, N, sim_N)
	ruinedCase = 0;
	for	i = 1:sim_N
		U = getU(u, alpha, c, lambda, T, N);
		ruinedCase = ruinedCase + (isRuined(U) ~= 0);
	end
	ruinProb = ruinedCase / sim_N;
end
