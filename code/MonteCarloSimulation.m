function eval = MonteCarloSimulation(eval_fun, input, N_sim)
	sum = 0;
	for i = 1:N_sim
		x = input();
		sum = sum + eval_fun(x);
	end
	eval = sum / N_sim;
end
