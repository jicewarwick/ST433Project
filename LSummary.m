function [mean var] = Lsummary()
	X_handle = @() SystemRiskModel(X0, a, sigma, N, T, N_sim);
	getDefaultTime_handle = @(x) getDefaultTime(x, D, T, N);
	NumofDefault_handle = @(x) NumofDefault(x, T);
	ETTau = MonteCarloSimulation(getDefaultTime_handle, X_handle, N_sim);

end
