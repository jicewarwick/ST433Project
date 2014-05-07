% Common Constants:
N_sim = 1000;
S0 = 40;
r = 0.03;
sigma = 1;
T = 1;

% Part Switch:
Part2 = 1;
Part3 = 0;
Part4 = 0;

% Part 2:
%-----------------------
if (Part2 == 1)
	for	i = 1:10
		for	j = 1:N_sim
			GB(i, j, :) = GeometricBrownianMotion(S0, r, i / 10, T, N_sim);
			S1(j) = GB(i, j, T*N_sim+1);
		end
		plot_data = log(S1) / (i/10);

		% hist plot
		fig = figure;
		hist(S1, 50);
		xlabel('log(S_T)');
		name = [ '1.logST_hist_sigma', num2str(i/10), '.pdf'];
		saveTightFigure(name);
		pause();
		close;
	end
end

% Part 3:
%-----------------------
K = 40; 
sigma = 0.9;
% Monte Carlo Method to valuate call option:
if (Part3 == 1)
	%for sigma = [0.1, 0.3, 0.8]
	sim_call_price = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
end

% Part 4:
%-----------------------
T = 1;
sigma = 0.2;
if (Part4 == 1)
	% Fixing T and varying K:
	for	i = 1:80
		K = i / 2;
		call_price_by_change_K(i) = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
	end
	x = 0.5:0.5:40;

	% plot
	plot(x, call_price_by_change_K);
	xlabel('K');
	ylabel('Call Price');
	print(fig, '-dpdf', '1.call_price_by_change_K.pdf');

	pause();

	K = 40;
	% Fixing K and varying T:
	for	i = 1:100
		T = i / 100;
		call_price_by_change_T(i) = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
	end
	x = 0.01:0.01:1;
	plot(x, call_price_by_change_T);
	print(fig, '-dpdf', '1.call_price_by_change_T.pdf');
	pause();

end
