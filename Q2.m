% Common Constants:
S0 = 40;
r = 0.03;
sigma = 0.2;
V0 = sigma^2;
K = 40;
T = 1;
N_int = 1000;
N_sim = 1000;

% Question Switch
Part1 = 1;
Part3 = 0;
Part4 = 0;
Part5 = 0;
Part6 = 1;
Part7 = 0;

% Part 1:
%-----------------------
alpha = 0.9;
beta = 0.04;
gamma = 0;
rho = 0.5;

if (Part1 == 1)
	stock_process = getHestonSimulation(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int);
	plot(stock_process);
end


% Part 3:
%-----------------------
if (Part3 == 1)
	for	i = 1:100;
		T = i / 100;
		call_price_by_change_T(i) = HestonCallPricingByMonteCarlo(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int, N_sim);
	end

	% plot
	plot(call_price_by_change_T);
	pause();
end

% Part 4:
%-----------------------
if (Part4 == 1)
	T = 1;
	K = 30:50;
	for	i = 1:size(K);
		call_price_by_change_K(i) = HestonCallPricingByMonteCarlo(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int, N_sim);
	end

	% plot
	plot(30:50, call_price_by_change_K);
	pause();
end

% Part 5:
%-----------------------
spot = 40;
r = 0.03;
K = 40;
t = 0;
T = 1;

if (Part5 == 1)
	implied_vol = getImpliedVolatility(r, spot, K, t, T, call_price_by_change_K);
	% plot
	plot(implied_vol, 30:50);
	pause();
end

% Part 6:
%-----------------------
K = 40;
T = 1;
%implied_vol = implied_vol(11);
implied_vol = 0.2;

if (Part6 == 1)
	barrier = [25, 30, 35];
	for i = 1:size(barrier)
		sim_down_and_out_option_price(i) = DownAndOutOptionPricingByMonteCarlo(S0, r, sigma, K, barrier(i), T, N_sim);
	end

end

% Part 7:
%-----------------------
x_max = 5;
N_tau_int = 20;
N_x_int = 100;

