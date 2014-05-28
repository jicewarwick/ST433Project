% Common Constants:
N_sim = 10000;
S0 = 40;
r = 0.03;
sigma = 1;
T = 1;
N_hist = 50;

% Part Switch:
Part2 = 0;
Part3 = 1;
Part4 = 0;

% Part 2:
%-----------------------
if (Part2 == 1)
	for	i = 2:2:10
		for	j = 1:N_sim
			GB(i, j, :) = GeometricBrownianMotion(S0, r, i / 10, T, N_sim);
			S1(j) = GB(i, j, T*N_sim+1);
		end
		plot_data = log(S1) / (i/10);

		% hist plot
		fig = figure;
		hist(plot_data, N_hist);
		xlabel('log(S_T)/\sigma');
		name = [ '1.logST_hist_sigma', num2str(i/10), '.pdf'];
		saveTightFigure(name);
		pause();
		close;
	end
end

% Part 3:
%-----------------------
K = 40; 
% Monte Carlo Method to valuate call option:
if (Part3 == 1)
	call_price = CallPricingByBSFormula(S0, r, sigma, K, 0, T);
	sim_call_price = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
end


% Part 4:
%-----------------------
T = 1;
sigma = 0.3;
if (Part4 == 1)
	% Fixing T and varying K:
	for	i = 1:160
		K = i / 2;
		call_price_by_change_K(i) = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
	end
	x = 0.5:0.5:80;
	call_val = 39.5:-.5:-40;
	call_val(80:160)=0;

	% plot
	plot(x, call_price_by_change_K, x, call_val);
	xlabel('K');
	ylabel('Call Price');
	saveTightFigure('1.call_price_by_change_K.pdf');

	pause();

	K = 40;
	N_sim = 2000;
	% Fixing K and varying T:
	for	i = 1:100
		T = i / 100;
		call_price_by_change_T(i) = CallPricingByMonteCarlo(S0, r, sigma, K, T, N_sim);
	end
	x = 0.01:0.01:1;
	plot(x, call_price_by_change_T);
	xlabel('T');
	ylabel('Call Price');
	saveTightFigure('1.call_price_by_change_T.pdf');
	pause();

end
